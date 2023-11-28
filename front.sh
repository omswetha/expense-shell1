echo -e " \e[36m installing the nginx \e[0m"
dnf install nginx -y
echo -e " \e[36m copy the expense.conf file \e[0m"
cp expense.conf  /etc/nginx/default.d/expense.conf
echo -e " \e[36m clean the data \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e " \e[36m download and extract the front end \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip
echo -e " \e[36m changing the directory \e[0m"
cd /usr/share/nginx/html

echo -e " \e[36m unzipping the frontend \e[0m"
unzip /tmp/frontend.zip
echo -e " \e[36m Enabling the nginx \e[0m"
systemctl enable nginx
echo -e " \e[36m restart the nignx \e[0m"
systemctl restart nginx