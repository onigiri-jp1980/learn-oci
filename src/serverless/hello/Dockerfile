FROM python:3.11-slim

WORKDIR /opt/app

COPY requirements.txt /opt/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY *.py /opt/app/

CMD ["python", "fn-fastapi.py"]
