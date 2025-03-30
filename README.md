# Particle41 work assessment - Simple python app with FastAPI
This repo contains the python code to run a server that returns the client's IP and server timestamp in a JSON response like so -
```
timestamp	"2025-03-30 07:25:58.503544"
ip	"169.254.169.254"
```

Stack used for development - 
```
python 3.12.8
fastapi 0.115.12
fastapi-cli 0.0.7
terraform 1.11.3
docker 28.0.1
```

### Directory structure
```
.
├── app <-- app files/directories and Dockerfile go here
├── terraform <-- Terraform files/directories go here (i.e. we will run `terraform plan`/`terraform apply` from here)
└── .gitignore <-- we don't want to push sensitive stuff or artifacts to the repo
```

### TODOs
1. Sanitise env handling in github workflows dir
2. Add remote backend
3. Make github actions work