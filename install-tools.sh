#!/bin/bash

while true; do
    echo "Choose the tools to install:"
    echo "1. Git"
    echo "2. Jenkins"
    echo "3. Docker & Docker-Compose"
    echo "4. Ansible"
    echo "5. Nginx"
    echo "6. Gunicorn"
    echo "7. Uwsgi"
    echo "8. PostgreSQL Client"
    echo "9. Node & Npm"
    echo "10. Python & Pip"
    echo "11. AWS CLI"
    echo "12. Prometheus"
    echo "13. Grafana"
    echo "0. Exit"

    read -p "Enter the tool number (0-11): " choice

    case $choice in
        1)
            # Git installation commands
            sudo apt update
            sudo apt install -y git
            git --version
            ;;
        2)
            # Jenkins installation commands
            sudo apt update
            sudo apt install -y fontconfig openjdk-17-jre
            java -version
            sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
            echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
            sudo apt-get update
            sudo apt-get install -y jenkins
            echo "Jenkins Initial Password: "
            sudo cat /var/lib/jenkins/secrets/initialAdminPassword  # Display Jenkins initial admin password
            ;;
        3)
            # Docker & Docker-Compose installation commands
            sudo apt update
            sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
            echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            sudo apt update
            sudo apt install -y docker-ce docker-ce-cli containerd.io
            sudo usermod -aG docker ubuntu
            sudo apt update
            sudo apt install -y curl jq
            sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
            docker --version
            docker-compose --version
            ;;
        4)
            # Ansible installation commands
            sudo apt update
            sudo apt install -y ansible
            ansible --version
            ;;
        5)
            # Nginx installation commands
            sudo apt update
            sudo apt install -y nginx
            sudo systemctl start nginx
            sudo systemctl enable nginx
            sudo systemctl status nginx
            ;;
        6)
            # Gunicorn installation commands
            sudo apt update
            sudo apt install -y python3-pip
            sudo pip3 install gunicorn
            gunicorn --version
            ;;
        7)
            # Uwsgi installation commands
            sudo apt update
            sudo apt install -y uwsgi uwsgi-plugin-python3
            sudo pip3 install uwsgi
            uwsgi --version
            ;;
        8)
            # PostgreSQL Client installation commands
            sudo apt update
            sudo apt install -y postgresql-client
            psql --version
            ;;
        9)
            # Node & Npm installation commands
            sudo apt update
            sudo apt install -y nodejs npm
            node --version
            npm --version
            ;;
        10)
            # Python & Pip installation commands
            sudo add-apt-repository ppa:deadsnakes/ppa
            sudo apt update
            sudo apt install -y python3.9
            sudo apt install -y python3.9-distutils  # Install distutils (required for pip)
            wget https://bootstrap.pypa.io/get-pip.py
            sudo python3.9 get-pip.py
            python3.9 --version
            pip3.9 --version
            ;;
        11)
            # AWS CLI installation commands
            sudo apt update
            sudo apt install -y awscli
            aws --version
            ;;
        12)
            # Prometheus installation commands
    sudo apt update
    sudo groupadd --system prometheus
    sudo useradd -s /sbin/nologin --system -g prometheus prometheus
    sudo mkdir /etc/prometheus
    sudo mkdir /var/lib/prometheus
    sudo wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
    tar xvf prometheus-2.43.0.linux-amd64.tar.gz
    cd prometheus-2.43.0.linux-amd64/
    sudo mv prometheus /usr/local/bin
    sudo mv promtool /usr/local/bin
    sudo chown prometheus:prometheus /usr/local/bin/prometheus
    sudo chown prometheus:prometheus /usr/local/bin/promtool
    sudo mv consoles /etc/prometheus
    sudo mv console_libraries /etc/prometheus
    sudo mv prometheus.yml /etc/prometheus
    sudo chown prometheus:prometheus /etc/prometheus
    sudo chown -R prometheus:prometheus /etc/prometheus/consoles
    sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
    sudo chown -R prometheus:prometheus /var/lib/prometheus

    # Create Prometheus systemd service file
    sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
    [Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF
    sudo systemctl daemon-reload
    sudo systemctl enable prometheus
    sudo systemctl start prometheus
    sudo ufw allow 9090/tcp

    echo "Go to ipaddress:9090 to access Prometheus"
        ;;

        13)
        # Grafana installation Commands
        sudo apt-get install software-properties-common
        sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
        wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install grafana
        sudo systemctl start grafana-server
        sudo systemctl enable grafana-server
        echo "Run at Ipaddress:3000"
        echo "After installing Grafana, use the following credentials to log in:"
        echo "Username: admin"
        echo "Password: admin"
        ;;

        0)
            echo "Exiting script."
            exit 0
            ;;
        *)
            if [[ ! $choice =~ ^[0-9]+$ ]]; then
                echo "Invalid input. Please enter a valid number. Exiting script."
            elif ((choice < 0 || choice > 11)); then
                echo "Invalid choice. Exiting script."
            fi
            ;;
    esac
done
