# Maintainer: Evan Hanson <evhan@thunktastic.com>
pkgname=chicken-git
pkgver=20110606
pkgrel=1
pkgdesc="A compiler for R5RS scheme, featuring handy extensions (git version)"
arch=('i686' 'x86_64')
url="http://www.call-cc.org"
license=('BSD')
depends=('gcc')
makedepends=('git' 'chicken')
conflicts=('chicken')

_gitroot="git://code.call-cc.org/chicken-core"
_gitname=$pkgname

build() {
	cd $srcdir
	msg "Connecting to GIT server..."

	if [ -d $srcdir/$_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/build"
  cp -r "$srcdir/$_gitname" "$srcdir/build"
  cd "$srcdir/build"

  make PLATFORM=linux PREFIX=/usr || return 1
}

package() {
  msg "Installing..."
  cd "$srcdir/build"
  make PLATFORM=linux PREFIX=/usr DESTDIR=$pkgdir install || return 1
}
