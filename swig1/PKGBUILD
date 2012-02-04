# Maintainer: Hilton Medeiros <medeiros.hilton at gmail dot com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig1
_pkgname=swig
pkgver=1.3.40
pkgrel=1
pkgdesc="A compiler that integrates C and C++ code with scripting languages (legacy version)"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('gcc-libs' 'zlib')
conflicts=('swig' 'swig-pantheon')
provides=('swig')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2df766c9e03e02811b1ab4bba1c7b9cc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
