FROM jupyter/base-notebook:python-3.10

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install UV
RUN curl -fsSL https://raw.githubusercontent.com/astral-sh/uv/main/install.sh | sh

# Add UV to PATH
ENV PATH="/root/.local/bin:${PATH}"

# Create a working directory
WORKDIR /workspace

# Copy requirements file (if you have one)
COPY requirements.txt .

# Create and activate UV virtual environment and install dependencies
RUN uv venv .venv && \
    source .venv/bin/activate && \
    if [ -f requirements.txt ]; then uv pip install -r requirements.txt; fi

# Expose Jupyter ports
EXPOSE 8888

# Start Jupyter Lab
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--allow-root"]
