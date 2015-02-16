# Maintainer: CrookedNixon <cn at crookednixon dot com>

pkgname=empcd-git
pkgver=59.da030e0
pkgrel=1
pkgdesc="Event Music Player Client daemon"
arch=('i686' 'x86_64')
url="http://unfix.org/projects/empcd/"
license=('modified BSD')
makedepends=('git')

_gitname=empcd
source=("git+https://github.com/massar/${_gitname}.git"
	"sbin.patch")
md5sums=('SKIP'
	 'e259496dbb51a17c5573748d87ad421e')

pkgver() {
  cd "${_gitname}"  ./configure --prefix=/usr
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  patch -Np0 -i "${srcdir}/sbin.patch"
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"
  mkdir -p "${pkgdir}/etc"
  install -m 644 "doc/empcd.conf" "${pkgdir}/etc/empcd.conf"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -m 644 "doc/empcd.1" "${pkgdir}/usr/share/man/man1/empcd.1"
}
