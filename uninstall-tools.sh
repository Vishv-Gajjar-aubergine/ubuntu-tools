#!/bin/bash

while true; do
    echo "Choose the tools to uninstall:"
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

    read -p "Enter the tool number to uninstall (0-13): " choice

    case $choice in
        1)
            # Git uninstallation commands
            sudo apt remove -y git
            ;;
        2)
            # Jenkins uninstallation commands
            sudo systemctl stop jenkins
            sudo systemctl disable jenkins
            sudo apt-get remove --purge -y jenkins
            ;;
        3)
            # Docker & Docker-Compose uninstallation commands
            sudo apt-get remove --purge -y docker-ce docker-ce-cli containerd.io
            sudo userdel -r ubuntu
            sudo rm /usr/local/bin/docker-compose
            ;;
        4)
            # Ansible uninstallation commands
            sudo apt remove -y ansible
            ;;
        5)
            # Nginx uninstallation commands
            sudo systemctl stop nginx
            sudo systemctl disable nginx
            sudo apt-get remove --purge -y nginx
            ;;
        6)
            # Gunicorn uninstallation commands
            sudo pip3 uninstall -y gunicorn
            ;;
        7)
            # Uwsgi uninstallation commands
            sudo apt-get remove --purge -y uwsgi uwsgi-plugin-python3
            sudo pip3 uninstall -y uwsgi
            ;;
        8)
            # PostgreSQL Client uninstallation commands
            sudo apt-get remove --purge -y postgresql-client
            ;;
        9)
            # Node & Npm uninstallation commands
            sudo apt-get remove --purge -y nodejs npm
            ;;
        10)
            # Python & Pip uninstallation commands
            sudo apt-get remove --purge -y python3.9
            sudo rm /usr/local/bin/pip3.9
            ;;
        11)
            # AWS CLI uninstallation commands
            sudo apt-get remove --purge -y awscli
            ;;
        12)
            # Prometheus uninstallation commands
            sudo systemctl stop prometheus
            sudo systemctl disable prometheus
            sudo rm -rf /usr/local/bin/prometheus /usr/local/bin/promtool /etc/prometheus /var/lib/prometheus /etc/systemd/system/prometheus.service
            sudo ufw deny 9090/tcp
            ;;
        13)
            # Grafana uninstallation Commands
            sudo systemctl stop grafana-server
            sudo systemctl disable grafana-server
            sudo apt-get remove --purge -y grafana
            ;;
        0)
            echo "Exiting script."
            exit 0
            ;;
        *)
            if [[ ! $choice =~ ^[0-9]+$ ]]; then
                echo "Invalid input. Please enter a valid number. Exiting script."
            elif ((choice < 0 || choice > 13)); then
                echo "Invalid choice. Exiting script."
            fi
            ;;
    esac
done
