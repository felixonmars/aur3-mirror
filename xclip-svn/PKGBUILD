# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=xclip-svn
_pkgname=xclip
pkgver=0.12.r85
pkgrel=1
pkgdesc='Command line interface to the X11 clipboard'
url='http://sourceforge.net/projects/xclip'
license=('GPL')
depends=('libxmu')
conflicts=('xclip')
provides=('xclip')
arch=('i686' 'x86_64')
source=("xclip::svn://svn.code.sf.net/p/xclip/code/trunk")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local ver="$( grep 'Version:' xclip.spec | awk '{print $2}' )"
  local rev="$( svnversion )"
  printf "%s.r%s" "$ver" "${rev//[[:alpha:]]}"
}

build() {
	cd "${srcdir}/${_pkgname}"
    autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
