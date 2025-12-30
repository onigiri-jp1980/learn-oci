from fastapi import FastAPI, Request
from fastapi.responses import PlainTextResponse

# Fn/OCI Functions だと docs を切るのが無難（サイズ・パスなどでハマりやすいので）
app = FastAPI(docs_url=None, redoc_url=None, openapi_url=None)

@app.post("/call")
async def call(request: Request):
    body = await request.body()
    return PlainTextResponse(body.decode("utf-8") or "Hello from FastAPI on OCI Functions")
