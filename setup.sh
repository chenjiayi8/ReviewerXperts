#!/bin/bash

# Create a new virtual environment
pip install virtualenv
virtualenv --python=python3.10 env
source env/bin/activate

# Install dependencies from requirements.txt
pip install -r requirements.txt

