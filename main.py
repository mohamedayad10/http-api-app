from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route("/live/<user_id>")
def get_user(user_id):
    user_data = {
        "user_id": user_id,
        "name": "Mohamed Mahmoud",
        "email": "mohamed.mahmoud.ayad1@gmail.com"
    }

    extra = request.args.get("extra")
    if extra:
        user_data["extra"] = extra
    return jsonify(user_data), 200


if __name__ == "__main__":
    app.run(debug=True)
#http://127.0.0.1:5000/live/123?extra=hello
