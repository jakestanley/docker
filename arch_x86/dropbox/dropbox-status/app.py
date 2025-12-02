from flask import Flask, jsonify
import docker
import os

app = Flask(__name__)
client = docker.from_env()

DROPBOX_CONTAINER = os.getenv("DROPBOX_CONTAINER", "dropbox")

@app.get("/status")
def status():
    try:
        container = client.containers.get(DROPBOX_CONTAINER)
        output = container.exec_run("dropbox status").output.decode().strip()

        return jsonify({
            "running": container.status == "running",
            "status": output
        })

    except Exception as e:
        return jsonify({
            "running": False,
            "status": "error",
            "error": str(e)
        }), 500

@app.get("/")
def root():
    return jsonify({"message": "dropbox status API"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
