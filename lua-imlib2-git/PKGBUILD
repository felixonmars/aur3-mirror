# Maintainer: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-imlib2-git
pkgver=20101218
pkgrel=1
pkgdesc="A complete binding to the Imlib2 image manipulation library."
arch="any"
url="https://github.com/asb/lua-imlib2"
license=('MIT')
depends=('lua>=5.1' 'imlib2')
makedepends=('git')
conflicts=('lua-imlib2')

_gitroot="$url.git"
_gitname="lua-imlib2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Installing..."

  #
  # BUILD HERE
  #

  cd "$srcdir/$_gitname"
	if [ $CARCH = x86_64 ]; then
		CFLAGS=-fPIC
	fi
	make CFLAGS=$CFLAGS
	install -Dm0775 limlib2.so \
		$pkgdir/usr/lib/lua/5.1/limlib2.so
	install -Dm0664 imlib2.lua \
		$pkgdir/usr/share/lua/5.1/imlib2.lua
	install -Dm0664 LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
} 
