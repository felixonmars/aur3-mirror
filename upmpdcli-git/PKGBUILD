pkgname=upmpdcli-git
_pkgname=upmpdcli
pkgver=20141016
pkgrel=1
pkgdesc="an UPnP front-end to the Music Player Daemon"
url="http://www.lesbonscomptes.com/upmpdcli/"
license="GPL"
depends=('libupnpp-git')
builddepends=(autoconf)
arch=(i686 x86_64)

source=("git://github.com/medoc92/upmpdcli.git")
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
