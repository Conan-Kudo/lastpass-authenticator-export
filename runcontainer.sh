#!/bin/bash
# Run container
podman run --rm --name goodbye -p 127.0.0.1:8080:80 byebyelp
