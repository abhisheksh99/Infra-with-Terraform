#!/bin/bash
# Update package list
apt update

# Install Apache server and Node.js
apt install -y apache2 nodejs npm

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Create a simple HTML page with portfolio content
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Node.js Project</title>
  <style>
    h1 { color: purple; }
    p { color: gray; }
  </style>
</head>
<body>
  <h1>Node.js Web App</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
  <p>Welcome to my Node.js Application hosted on Apache</p>
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2

# Install a basic Node.js app to run in the background
mkdir /home/ubuntu/node-app
cd /home/ubuntu/node-app
echo "console.log('Node.js app is running');" > app.js
nohup node app.js &

echo "Node.js app is running in the background"
