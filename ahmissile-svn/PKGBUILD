# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ahmissile-svn
pkgver=2
pkgrel=1
pkgdesc="A simple abstracted interface to the library files of ah-missile."
arch=('i686' 'x86_64')
url="http://www.assembla.com/spaces/USBMC"
license=('GPL')
depends=('libusbx' 'gtk2')
makedepends=('subversion')

_svntrunk="http://subversion.assembla.com/svn/USBMC"
_svnmod="ahmissile"

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."

	if [[ -d "$_svnmod/.svn" ]]; then
	  (cd "$_svnmod" && svn up -r "$pkgver")
	else
	  svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build/trunk/MissileLauncher/ahmissile-0.5"

  ./configure --prefix=/usr
  make
}

package() {
	cd "$srcdir/$_svnmod-build/trunk/MissileLauncher/ahmissile-0.5"
	make DESTDIR="$pkgdir/" install
	rmdir "$pkgdir/usr/share"
}
