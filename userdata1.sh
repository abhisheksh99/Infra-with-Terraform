#!/bin/bash
# Update package list
apt update

# Install Nginx and Python with Flask
apt install -y nginx python3 python3-pip

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install Flask
pip3 install flask

# Create a simple Flask app
mkdir -p /home/ubuntu/flask-app
cat <<EOF > /home/ubuntu/flask-app/app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return f'<h1>Flask App on Nginx</h1><p>Instance ID: {INSTANCE_ID}</p>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Set up Nginx to reverse proxy to Flask app
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# Start Nginx and enable it on boot
systemctl start nginx
systemctl enable nginx

# Start Flask app in the background
nohup python3 /home/ubuntu/flask-app/app.py &

echo "Flask app running and Nginx reverse proxy configured"
