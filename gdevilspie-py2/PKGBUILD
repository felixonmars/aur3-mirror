# Maintainer: thc_flow <thc@weedsmoker.im>
pkgname=gdevilspie-py2
pkgver=0.5
pkgrel=1
pkgdesc="pyGTK interface to devilspie - for python2"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gdevilspie"
license=('GPL')
depends=('pygtk' 'devilspie' 'python-wnck')
makedepends=()
source=("http://gdevilspie.googlecode.com/files/gdevilspie-$pkgver.tar.bz2"
	"py2.patch")
md5sums=('aab8eecb47599467c65c77d3eddb2d5c'
	'e6938903a20c48c4cc57f24cc12692d0')
build() {
  cd "$srcdir/gdevilspie-$pkgver"
  patch -p0 -i $srcdir/py2.patch
  mkdir -p $pkgdir/usr
  python2 setup.py install --prefix $pkgdir/usr  
}

# vim:set ts=2 sw=2 et:
