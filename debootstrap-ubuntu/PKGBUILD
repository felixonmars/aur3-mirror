# Contributor: Abakus <java5 at arcor dot de>
pkgname=debootstrap-ubuntu
pkgver=1.0.37
pkgrel=1
pkgdesc="debootstrap is used to create an Ubuntu base system from scratch, without requiring the availability of dpkg or apt"
arch=('i686' 'x86_64')
license=('GPL')
url="https://wiki.ubuntu.com/DebootstrapChroot"
depends=( 'glibc')
source=("http://archive.ubuntu.com/ubuntu/pool/main/d/debootstrap/debootstrap_${pkgver}_all.deb")
md5sums=('b577bff397f0128c03f0f073081f938e')

build(){
  tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
  
  if test "$CARCH" == x86_64; then
  	darch="amd64"
  else
	darch="i386"
  fi
  echo "$darch" > ${pkgdir}/usr/share/debootstrap/arch
}
