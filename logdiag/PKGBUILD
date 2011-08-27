pkgname=(logdiag)
pkgver=0.1.2
pkgrel=2
pkgdesc="Schematic editor"
arch=('i686' 'x86_64')
url="http://github.com/pjanouch/logdiag"
license=('BSD')
groups=()
depends=('json-glib>=0.10.4' 'gtk2>=2.12' 'lua>=5.1' 'librsvg>=2.0')
makedepends=('cmake>=2.6')
optdepends=()
backup=()
options=()
install=logdiag.install
source=(https://github.com/pjanouch/${pkgname}/tarball/v${pkgver})
noextract=()
md5sums=('f2c216e38590418ef9897b21ab39ce2d')

build() {
  cd $srcdir/pjanouch-${pkgname}-*

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
}

package() {
  cd $srcdir/pjanouch-${pkgname}-*

  make DESTDIR=$pkgdir install || return 1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

