#!/bin/bash

gunicorn ReviewerXperts.wsgi:application --bind 0.0.0.0:8000
bash -c "tail -f /dev/null"
