# Contributor: Calimero <calimeroteknik at free dot fr>

_pkgname=libstsound2
pkgname="${_pkgname}-svn"
pkgver=608
pkgrel=1
pkgdesc='Amstrad AY3-8912 audio chip emulator library'
arch=('i686' 'x86_64')
url='http://cpcsdk.googlecode.com/'
license=('GPL')
makedepends=('subversion')
source=("${_pkgname}::svn+https://cpcsdk.googlecode.com/svn/trunk/libstsound")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  svnversion
}

build() {
  cd "${srcdir}/${_pkgname}"

  msg 'build_config.sh…'
  ./build_config.sh

  msg './configure…'
  ./configure --prefix=/usr

  msg 'make…'
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install DESTDIR="${pkgdir}"
}
