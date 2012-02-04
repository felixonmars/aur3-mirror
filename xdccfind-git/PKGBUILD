# Maintainer: addikt1ve <the.addikt1ve@gmail.com>

pkgname=xdccfind-git
pkgver=20100926
pkgrel=1
pkgdesc="Find xdcc links within your shell"
arch=('i686' 'x86_64')
url="http://github.com/addikt1ve/xdccfind"
license=('GPL')
depends=('coreutils' 'curl')
optdepends=('less')
makedepends=('git')

_gitroot=http://github.com/addikt1ve/xdccfind.git
_gitname=xdccfind

build () {
  cd "$srcdir"

	msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd .. || return 1
  else
    git clone $_gitroot $_gitname || return 1
  fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

  rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	mkdir -p $pkgdir/usr/bin/

	cp *xdccfind.sh $pkgdir/usr/bin/
}
