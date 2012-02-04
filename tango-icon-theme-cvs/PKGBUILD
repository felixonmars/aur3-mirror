# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=tango-icon-theme-cvs
pkgver=20111211
pkgrel=1
pkgdesc="The Tango Desktop Project exists to create a consistent user experience"
arch=('any')
url="http://tango-project.org"
license=('CCPL')
depends=('librsvg')
conflicts=('tango-icon-theme')
provides=('tango-icon-theme')
makedepends=('cvs' 'imagemagick' 'icon-naming-utils' 'gnome-common')

_cvsroot=":pserver:anoncvs@anoncvs.freedesktop.org:/cvs/tango"
_cvsmod="tango-icon-theme"

build() {
	cd "$srcdir"
	msg "Connecting to anoncvs.freedesktop.org CVS server...."

	if [[ -d "$_cvsmod/CVS" ]]; then
	  cd "$_cvsmod"
	  cvs -z3 update -d
	else
	  cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
	  cd "$_cvsmod"
	fi

	msg "CVS checkout done or server timeout"
	msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

	./autogen.sh

	./configure --prefix=/usr
	make
}

package() {
  cd "$srcdir/$_cvsmod-build"
	make DESTDIR="$pkgdir" install
}
