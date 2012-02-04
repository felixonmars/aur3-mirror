# Contributor: Gonzalo Lorca <human at vtr.net>

pkgname=mitter-alpha
pkgver=1.0.0.alpha7
pkgrel=1
pkgdesc="Micro-blogging client with multiple interfaces"
arch=('i686' 'x86_64')
url="http://mitter.googlecode.com/"
license=('GPL3')
depends=(python)
optdepends=(gtk2: GUI Support)
provides=(mitter-alpha)
conflicts=(mitter)
install=mitter.install
source=(http://mitter.googlecode.com/files/mitter-$pkgver.tar.gz)
md5sums=('651dd9abf196a60e584931ac16106406')

build() {
  cd "$srcdir/mitter-$pkgver"
  python setup.py install --root="$pkgdir" || return 1
  install -D -m644 "mitter.desktop" \
  	"${pkgdir}/usr/share/applications/mitter.desktop"
  
}
