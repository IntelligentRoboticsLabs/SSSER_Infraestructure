# SIGSOFT Support for Summer/Winter Schools in Software Engineering


## Prerequisites

### 1. Install Docker Desktop on Ubuntu

First, install Docker Desktop on your Ubuntu system. Follow the official Docker documentation for instructions: [Docker Desktop on Ubuntu](https://docs.docker.com/desktop/install/ubuntu/).

### 2. Install the NVIDIA Container Toolkit

To use GPU resources within your Docker containers, install the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html). Follow these steps:

- Configure the production repository:
```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

- Update the packages list from the repository:
```sh
sudo apt-get update
``` 

- Install the NVIDIA Container Toolkit packages:
```sh
sudo apt-get install -y nvidia-container-toolkit
``` 

- Configure the container runtime by using the nvidia-ctk command:
```sh
sudo nvidia-ctk runtime configure --runtime=docker
``` 

The nvidia-ctk command modifies the /etc/docker/daemon.json file on the host. The file is updated so that Docker can use the NVIDIA Container Runtime.

- Restart the Docker daemon:
```sh 
sudo systemctl restart docker
``` 
## Docker infraestructure
### 3. Clone the Repository
Create a directory for the SIGSOFT environment and clone the repository:
```sh
mkdir ~/sigsoft && cd ~/sigsoft
git clone https://github.com/IntelligentRoboticsLabs/SSSER_Infraestructure.git
```
### 4. Build the Docker image
Navigate to the Docker directory and build the Docker image:
```sh
cd ~/sigsoft/SSSER_Infraestructure/docker/
docker buildx build --platform=linux/amd64 -t sigsoft:v1.0 .
```
## 5. Run Docker image:
Run the Docker image using the provided script:
```
./run_docker.sh
```
## 6. Access the Environment
Open your browser and go to: http://localhost:6080/

You should see the environment running:

![Environment](images/environment.png)

## Professors
## 8. Create an installation script
Create a custom installation script with the necessary setup for your courses and place it inside the `installation_scripts` folder.

## 9. Follow steps 4 to 7 again
Build the Docker image and run it as described in steps 4 to 7.

## 10. Execute Your Script Inside the Docker
Once the Docker container is running, open a terminal inside the container and execute your script:
```sh
source /installation_scripts/your_script.sh
```