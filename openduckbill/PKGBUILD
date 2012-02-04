# Contributor: Aaron Bishop <erroneous@gmail.com>
pkgname=openduckbill
pkgver=1.0.0
pkgrel=1
pkgdesc="Openduckbill is a simple command line backup tool for Linux"
arch=(i686)
url="http://code.google.com/p/openduckbill/"
license=('GPL2')
groups=()
depends=(python24 rsync openssh python-yaml)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=openduckbill.install
source=(http://openduckbill.googlecode.com/files/$pkgname-$pkgver.tar.bz2 \
	openduckbill.install openduckbill openduckbill.conf)
md5sums=('7cb6725871b84547de9b9055489b50a1'
         'e304fc9225bb8b1bfe307438c481114d'
         'a7ea64d7fcea2b24b191a2de96d0b1a9'
         'ed20ae99cd70c556fb002048fda37e39')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/opt/openduckbill
  ./install.sh $pkgdir/opt/openduckbill || return 1
  mkdir -p $pkgdir/etc/rc.d
  cp $srcdir/openduckbill $pkgdir/etc/rc.d/
  cp $srcdir/openduckbill.conf $pkgdir/etc/
  
}
