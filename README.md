# Assignment #4: Application Containerization

This is a simple Node.js web application designed for learning Docker containerization concepts.

## Application Overview

This application is a basic Express.js web server that:
- Serves a static HTML page at the root (`/`)
- Provides an API status endpoint at `/api/status`
- Includes a health check endpoint at `/health`
- Runs on port 3000 by default (configurable via PORT environment variable)

## What's Included

- **app.js**: Main application server file
- **package.json**: Node.js dependencies and project configuration
- **public/index.html**: Static HTML page that confirms successful containerization
- **public/style.css**: Styling for the web page

## Running Without Docker (for reference only)

If you wanted to run this application directly (not required for assignment):
```bash
npm install
npm start
```

## Your Docker Assignment

**DO NOT MODIFY THE APPLICATION CODE**

Your task is to containerize this existing application using Docker. You need to:

1. Create a `Dockerfile` that properly containerizes this Node.js application
2. Build a Docker image from your Dockerfile
3. Run a container from your image
4. Verify the application works by accessing it in your browser

## Starting the Application
### Build the image
```bash
docker build -t my-node-app .
```

### Run the container
```bash
docker run -d -p 3000:3000 --name my-node-container my-node-app
```
- To build the docker image run the command:

```bash

```

- To run your docker container in port 3000 run the command:

```bash

```

## Reflection Question
**Answer the following question in the space below**: How does containerization with Docker differ from using virtual machines, and why might a development team choose Docker containers over VMs for deploying applications like the one you just containerized?
Virtual machines emulate an entire computer, including hardware, and each VM runs its own full guest operating system on top of a hypervisor. Docker containers instead share the host machine's OS kernel and only package the application with its dependencies and runtime, isolated from other processes. Because of this, containers are much lighter than VMs: they are typically megabytes rather than gigabytes, start in seconds rather than minutes, and use far less CPU and memory.

A development team might choose Docker over VMs for an application like this Node.js app because containers are faster to build, start, and scale, and many can run on a single machine. The Dockerfile also documents the environment as code, so every developer and server runs the identical setup, which avoids the "it works on my machine" problem. This portability makes containers a good fit for CI/CD pipelines and cloud deployment. VMs still make sense when stronger isolation is needed or when a different operating system must be run, but for deploying a simple web app, containers are the more efficient choice.



## Application Requirements for Docker

Your Dockerfile should ensure:
- The application has Node.js runtime available
- All application files are copied into the container
- Dependencies are installed (`npm install`)
- Port 3000 is exposed
- The application starts with `npm start`
- The container can be accessed from your host machine

## Verification

When your Docker container is running correctly:
- Navigate to `http://localhost:3000` (or whatever port you mapped)
- You should see a success page confirming containerization worked
- The `/api/status` endpoint should return JSON status information

## Troubleshooting Tips

- Make sure your port mapping is correct in the `docker run` command
- Check that all files are copied into the container
- Verify Node.js dependencies are installed in the container
- Use `docker logs <container-name>` to see application output

## File Structure Expected
```
docker-assignment/
├── Dockerfile          # You create this
├── app.js              # Provided
├── package.json        # Provided
├── public/             # Provided
│   ├── index.html      # Provided
│   └── style.css       # Provided
└── README.md           # This file
```

Good luck with your Docker containerization!