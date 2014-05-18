# Maintainer: Milan Knížek <knizek@volny.cz>
pkgname=kdeplasma-widget-x2go
_pkgname=x2goplasmabindings
pkgver=3.0.2.0
pkgrel=1
pkgdesc="Plasma widget for control of X2go sessions (also known as x2goplasmabindings)."
arch=('i686' 'x86_64')
url="http://code.x2go.org/releases/source/x2goplasmabindings"
license=('GPL')
depends=('x2goserver>=3.1.1.2' 'kdebase-workspace>=4.2')
replaces=('x2goplasmoid' 'x2goplasmoidbindings')
makedepends=('cmake' 'kdebase-workspace>=4.2')
options=(emptydirs)
groups=('x2go' 'alts' 'kde' 'kdeplasma-addons')
options=(!strip)
install=kdeplasma-widget-x2go.install
source=('copyright'
        "http://code.x2go.org/releases/source/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/$KDEDIRS ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build || return 1
  make DESTDIR="$pkgdir" install

  cd ..
  gzip ChangeLog
  install -d -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install    -m 644 -t "$pkgdir/usr/share/doc/${pkgname}" ChangeLog.gz
  install    -m 644 -t "$pkgdir/usr/share/doc/${pkgname}" README
  install    -m 644 -t "$pkgdir/usr/share/doc/${pkgname}" ../copyright
  
  install -d -m 755 -d "${pkgdir}/usr/share/x2go/versions"
  echo ${pkgver} > "${pkgdir}/usr/share/x2go/versions/VERSION.$pkgname"

}
md5sums=('eccd7bc40473e592d923a3a190fc904e'
         'c1c5c7b1dc4c9af3f67144ae19794e75')
