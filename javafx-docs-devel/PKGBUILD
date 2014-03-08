# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=javafx-docs-devel
_build=b132
_date=03_mar_2014
pkgver=8${_build}
pkgrel=1
pkgdesc='JavaFX Devel API Documentation'
arch=('any')
url='http://www.oracle.com/technetwork/java/javafx/index.html'
license=('custom')
options=('docs' '!strip')
conflicts=('javafx-docs')
provides=('javafx-docs')
source=("http://www.java.net/download/jdk8/archive/${_build}/binaries/javafx-8_0_0-fcs-apidocs-${_build}-${_date}.zip"
        'LICENSE')
md5sums=('264f6ced2d5e68a7dcf1cdfadf420030'
         '5ee4bb1a01409d717e5febb9908d1abb')

package() {
  install -d "${pkgdir}"/usr/share/doc/javafx
  cp -r api/* "${pkgdir}"/usr/share/doc/javafx

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}
}
