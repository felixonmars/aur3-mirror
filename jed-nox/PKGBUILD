# Maintainer: Ernie Brodeur <ebrodeur@ujami.net>

pkgname=jed-nox
_jed_src=jed
pkgver=0.99.19
_pkgver=0.99-19
pkgrel=1
pkgdesc="A freely available text editor for Unix and others OS, no X11/mouse version."
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/jed"
license=('GPL')
depends=('slang')
options=('!makeflags')
conflicts=('jed')
source=("ftp://space.mit.edu/pub/davis/${_jed_src}/v0.99/${_jed_src}-${_pkgver}.tar.bz2")
md5sums=('c9b2f58a3defc6f61faa1ce7d6d629ea')

build() {
  cd "${srcdir}/${_jed_src}-${_pkgver}"

  ./configure --disable-gpm --disable-xft --prefix=/usr JED_ROOT=/usr/share/jed

  make
}

package() {
  cd "${srcdir}/${_jed_src}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
}
