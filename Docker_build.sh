docker build -t polaris-slave03:v3.2 --build-arg ssh_prv_key="$(cat id_rsa)" --build-arg ssh_pub_key="$(cat id_rsa.pub)" . -f new_Dockerfile
