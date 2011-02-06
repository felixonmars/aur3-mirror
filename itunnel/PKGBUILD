#Mantainer: Matias Hernandez <msdark@archlinux.cl>
#Contributor: Matias Hernandez <msdark@archlinux.cl>
pkgname=itunnel
pkgver=0.0.9
pkgrel=1
pkgdesc="A simple command line program wich provides SSH tunnelling over the USB cable to a jailbroken iPhone and iPod Touch"
arch=(i686)
url="http://www.cs.toronto.edu/~jingsu/itunnel/"
license=('GPL')
depends=('libusb' 'libiphone')
provides=('itunnel')
options=('strip')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('adf2e8730b196185ca65a6b83136350f')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make clean
  make || return 1
  install -D -m755 itunnel ${pkgdir}/usr/bin/itunnel
}

# vim:set ts=2 sw=2 et:
