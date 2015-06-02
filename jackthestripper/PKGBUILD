# Maintainer: User_X <user_x@riseup.net>

pkgname=JackTheStripper
pkgver=0.1
pkgrel=1
pkgdesc='Man in the middle automated attacks - This project aims to perform MITM attacks in automated way.'
arch=('i686' 'x86_64')
url='https://gitlab.com/lampiaosec/Jackthestripper.git'
license=('GPL')
#depends=('iptables' 'community/sslstrip' 'community/ettercap')
#makedepends=('yaourt')
#install='jackthestripper.install'
source=("https://gitlab.com/lampiaosec/Jackthestripper/repository/archive.zip")
md5sums=('ef1089f740990450d2c6e268e39aa052')


prepare() {
  echo 'installing' 
}

build() {
  echo $(pwd)
  sudo chmod +x Jackthestripper.git/jackthestripper.py

}

package() {
  sudo mv Jackthestripper.git/jackthestripper.py /usr/bin/jackthestripper 

}

# vim: ts=2 sw=2 et:
