## Simple python app with FastAPI that returns a JSON response with client_ip and server timestamp

### To run it locally
1. Install dependencies with `pip install -r requirements.txt`
2. To run in development mode, `fastapi dev`
3. To run in production mode, `fastapi run`

### To build a docker image
1. Run `docker build -t python-app .`

### To run the app using the docker image
1. Run `docker run --name python-app -p 8000:8000 python-app`

### To push the docker image to Dockerhub
1. We first need to tag the image for the repository. We do that with `docker tag python-app TARGET_REPOSITORY:TAG`
2. Then push the image with `docker push TARGET_REPOSITORY:TAG`