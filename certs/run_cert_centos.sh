# openssl s_client -showcerts -connect updates.jenkins.io:443
 for file in *crt; do echo $file; keytool -importcert -keystore /usr/lib/jvm/java-11-openjdk-amd64/lib/security/cacerts -storepass changeit -file $file -alias $file; done
