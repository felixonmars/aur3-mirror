# Maintainer: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=blocxx-svn
pkgver=544
pkgrel=1
pkgdesc="A cross-platform, general purpose C++ framework for application development"
provides=('blocxx')
conflicts=('blocxx')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/blocxx"
license=('BSD')
depends=('openssl' 'pcre')
makedepends=('bc' 're2c' 'subversion')
source=()

_svntrunk='https://blocxx.svn.sourceforge.net/svnroot/blocxx/trunk'
_svnmod='blocxx'

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
	cd "$srcdir/$_svnmod-build"

  aclocal
	libtoolize --force --automake --copy
	autoheader
	automake --add-missing --copy
	autoconf
	./configure --prefix=/usr
	make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
