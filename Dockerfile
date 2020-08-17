FROM python:3.7.7-stretch

## Complete Step 1:
# Create a Working Directory
WORKDIR /app

## Complete Step 2:
# Copy source code to working directory
COPY requirements.txt app.py /app/
COPY static /app/static/
COPY templates /app/templates/

## Complete Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
#hado
RUN pip install --upgrade pip &&\
	pip install --trusted-host pypi.python.org -r requirements.txt

## Complete Step 4:
# Expose port 80
EXPOSE 5000

## Complete Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]