FROM mcr.microsoft.com/vscode/devcontainers/python:3.10

# Install UV
RUN python -m pip install uv

# Set up the virtual environment
RUN python -m uv venv /workspace/.venv

# Install required packages
COPY requirements.txt /workspace
RUN . /workspace/.venv/bin/activate && pip install -r /workspace/requirements.txt

# Automatically activate virtual environment
COPY activate.sh /etc/profile.d/activate.sh
