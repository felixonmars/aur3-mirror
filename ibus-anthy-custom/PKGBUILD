_pkgname=ibus-anthy
pkgname=${_pkgname}-custom
pkgver=1.2.7
pkgrel=1
conflicts=(${_pkgname})
provides=(${_pkgname}-${pkgver})
pkgdesc="Japanese input method Anthy IMEngine for IBus Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus' 'anthy' 'python2')
makedepends=('swig' 'intltool')
options=('!libtool')
source=(http://ibus.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
md5sums=('091a13ff950171981768463993ffb683')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PYTHON=python2
  ./configure --prefix=/usr --libexec=/usr/lib/ibus
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
