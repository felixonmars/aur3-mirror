pkgname=libupnpp-git
_pkgname=libupnpp
pkgver=20141016
pkgrel=1
pkgdesc="a C++ wrapper for libupnp - used with upmpdcli or upplay"
url="https://github.com/medoc92/libupnpp"
license="GPL"
depends=('libupnp')
builddepends=(autoconf)
arch=(i686 x86_64)

source=("git://github.com/medoc92/libupnpp.git")
md5sums=('SKIP')

build() {

  cd ${srcdir}/${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="${pkgdir}/" install
}