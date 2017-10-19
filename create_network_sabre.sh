#!/usr/bin/env bash
get_services()
{
  services=''
  networksetup -listallhardwareports | grep 'Hardware Port: Wi-Fi' > /dev/null
  [ "$?" -eq 0 ] && services='Wi-Fi'

  networksetup -listallhardwareports | grep 'Hardware Port: Ethernet' > /dev/null
  [ "$?" -eq 0 ] && services=$services' Ethernet'
}

#create each service
create_services()
{
  for service in $services; do
    echo "networksetup -createnetworkservice $service"
    sudo networksetup -createnetworkservice $service $service
  done
}

# setup for each service
setup()
{
  for service in $services; do
    echo "networksetup $1 $service ${@:2}"
    sudo networksetup $1 $service ${@:2}
  done
}


location=Sabre
echo "networksetup -createlocation $location"
sudo networksetup -createlocation $location
sudo networksetup -switchtolocation $location

# get available hardware -> $services
get_services
create_services

#---- setup
# DNS
#setup -setdnsservers 133.44.62.200 133.44.62.201
#setup -setsearchdomains nagaokaut.ac.jp
# set proxy
proxy=127.0.0.1
port=8080
setup -setwebproxy $proxy $port
setup -setsecurewebproxy $proxy $port
setup -setftpproxy $proxy $port
noproxy='*.local 169.254/16 127.0.0.1 localhost 10.10.10.10 *.nagaokaut.ac.jp'
setup -setproxybypassdomains "${noproxy}"