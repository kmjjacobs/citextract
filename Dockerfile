FROM python:3.5
RUN pip install "torch>=1.0.0,<2.0.0"
COPY requirements-dev.txt /requirements-dev.txt
RUN pip install -r /requirements-dev.txt
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY . /app/
WORKDIR /app/