FROM quay.io/centoshyperscale/centos:stream9

RUN dnf --assumeyes install nginx-core python3 python3-pip
RUN mkdir export
RUN ln -s /export /usr/share/nginx/html/export
COPY requirements.txt .
COPY export.sh .
COPY lastpass-authenticator-export.py .
RUN chmod +x export.sh
RUN pip3 install -r requirements.txt

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
