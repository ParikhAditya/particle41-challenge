from datetime import datetime
from fastapi import FastAPI, Request

app = FastAPI()

@app.get("/")
async def root(request: Request):
    # Get the client host from the request
    x_forwarded_for = request.headers.get("X-Forwarded-For")
    client_host = x_forwarded_for.split(",")[0] if x_forwarded_for else request.client.host

    # Get server datetime
    server_datetime = datetime.now()

    return {
        "timestamp": f"{server_datetime}",
        "ip": f"{client_host}"
    }