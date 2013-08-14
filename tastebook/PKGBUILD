# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=tastebook
pkgver=0.2.5
pkgrel=1
pkgdesc="A smart cookbook"
arch=('i686' 'x86_64')
url="https://launchpad.net/tastebook"
depends=('libsoup' 'imagemagick' 'json-glib' 'gtk3')
makedepends=('cmake' 'vala')
license=('GPL3')
md5sums=('SKIP')
install=tb.install
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('a0e14bc9f505e341d80d05a8647ecb25')
conflicts=('tastebook-bzr')

build() {
  cd ${pkgname}-${pkgver}
  cmake CMakeLists.txt
  cd src
  make

}
package() {
    cd ${pkgname}-${pkgver}
    sed -i -e 's#/usr/local#/usr#g' \
           -e 's#tastebook-icon-128.png#tastebook.png#' \
	   tastebook.desktop
    install -Dm644 tastebook.desktop ${pkgdir}/usr/share/applications/tastebook.desktop
    install -Dm644 it.robol.tastebook.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/it.robol.tastebook.gschema.xml

    install -Dm644 resources/ui/images/tastebook-icon-128.png \
      ${pkgdir}/usr/share/pixmaps/tastebook.png
    install -Dm755 src/tastebook ${pkgdir}/usr/bin/tastebook
}

