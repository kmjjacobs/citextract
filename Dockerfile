FROM pytorch/pytorch
COPY requirements-dev.txt /requirements-dev.txt
RUN pip install -r /requirements-dev.txt
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY . /app/
WORKDIR /app/