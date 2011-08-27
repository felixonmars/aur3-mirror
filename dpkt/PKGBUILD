# Contributor: Ruben Schuller <shiml@orgizm.net>
arch=('i686' 'x86_64')
pkgname=dpkt
pkgver=1.7
pkgrel=1
pkgdesc="fast, simple packet creation / parsing module for python, with definitions for the basic TCP/IP protocols."
makedepends=()
depends=('python2')
source=(http://dpkt.googlecode.com/files/dpkt-$pkgver.tar.gz)
url="http://code.google.com/p/dpkt/"
md5sums=('0baa25fd5d87066cf6189a66cf452ac0')
license="BSD"

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  python2 setup.py install --prefix=$startdir/pkg/usr 

}
