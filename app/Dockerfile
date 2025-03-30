# Using ECR public gallery, lest we run into 429s from Dockerhub
FROM public.ecr.aws/docker/library/python:3.12.9-slim

# Define the host and port that our server will listen on
ENV LISTENER_PORT=8000
ENV LISTENER_HOST="0.0.0.0"

# Creating a non-root user
RUN useradd -ms /bin/bash 1000

# Using the non-root user's workspace
WORKDIR /home/1000

COPY requirements.txt .
RUN pip install -r requirements.txt

# Switching to the non-root user
USER 1000
EXPOSE ${LISTENER_PORT}
COPY --chown=1000:1000 . .

CMD ["sh", "-c", "fastapi run --host $LISTENER_HOST --port $LISTENER_PORT"]
