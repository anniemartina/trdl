# start by pulling the python image
FROM python:3.10-slim

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
#ENTRYPOINT [ "python" ]
ENTRYPOINT ["gunicorn", "trdl:app", "--workers", "1", "--bind", "0.0.0.0:80"]

CMD ["--log-level", "debug"]
