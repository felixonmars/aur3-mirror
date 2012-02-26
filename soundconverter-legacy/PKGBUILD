# Maintainer: Patrick Melo <patrick@patrickmelo.com.br>

pkgname=soundconverter-legacy
_pkgname=soundconverter
pkgver=1.5.4
pkgrel=1
pkgdesc="A simple sound converter application for GNOME (legacy version)"
arch=('any')
license=('GPL3')
url="http://soundconverter.org/"
depends=('gnome-python' 'gstreamer0.10-python' 'hicolor-icon-theme'
         'gstreamer0.10-ugly-plugins' 'gstreamer0.10-good-plugins')
makedepends=('perlxml' 'intltool')
optdepends=('gstreamer0.10-base-plugins: for ogg support')
conflicts=('soundconverter')
provides=('soundconverter')
install=soundconverter.install
source=("http://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('5f4069e29764b4b1b0418c9b4ce035f7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHON=python2  ./configure --prefix=/usr
  make
  sed -i 's#/usr/bin/python#/usr/bin/python2#' src/soundconverter
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
