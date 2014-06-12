docker run -d -t --name="dnsserver" --hostname="dns.docker.lnet" mayflower.bind named -c /etc/bind/named.conf -f -g
dnsip=`docker inspect dnsserver | grep IPAddress | awk '{print $2}' | tr -d '",\n'`
echo -e "server $dnsip\nzone docker.lnet\nupdate delete dns.docker.lnet A\nupdate add dns.docker.lnet 300 A $dnsip\nsend\n" | nsupdate -k Kdocker_key.+157+61157.key
