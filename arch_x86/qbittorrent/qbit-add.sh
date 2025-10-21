#!/usr/bin/env bash
set -euo pipefail

QBIT_URL="http://localhost:8090"   # change if remote or different port
QBIT_USER="admin"
COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 file1.magnet [file2.magnet ...]"
  exit 1
fi

# --- Prompt for password securely ---
read -s -p "qBittorrent password: " QBIT_PASS
echo

# --- Log in ---
LOGIN_RESP=$(curl -s -c "$COOKIE_FILE" \
  -d "username=${QBIT_USER}&password=${QBIT_PASS}" \
  "${QBIT_URL}/api/v2/auth/login")

if [[ "$LOGIN_RESP" != "Ok." ]]; then
  echo "Login failed."
  exit 1
fi

# --- Get category list ---
CATEGORIES_JSON=$(curl -s -b "$COOKIE_FILE" "${QBIT_URL}/api/v2/torrents/categories")
CATEGORIES=($(echo "$CATEGORIES_JSON" | jq -r 'keys[]'))

if [ ${#CATEGORIES[@]} -eq 0 ]; then
  echo "No categories found in qBittorrent."
  CATEGORY=""
else
  echo "Select category:"
  if command -v fzf >/dev/null; then
    CATEGORY=$(printf "%s\n" "${CATEGORIES[@]}" | fzf --prompt="Category: ")
  else
    select CATEGORY in "${CATEGORIES[@]}"; do
      [ -n "$CATEGORY" ] && break
    done
  fi
fi

# --- Add each magnet ---
for FILE in "$@"; do
  if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE"
    continue
  fi

  MAGNET=$(<"$FILE")
  echo "Adding torrent: $(basename "$FILE")"
  curl -s -b "$COOKIE_FILE" \
    --data-urlencode "urls=$MAGNET" \
    -d "autoTMM=true" \
    ${CATEGORY:+-d "category=$CATEGORY"} \
    "${QBIT_URL}/api/v2/torrents/add" >/dev/null

  echo "✓ Added $FILE"
done

echo "Done."

