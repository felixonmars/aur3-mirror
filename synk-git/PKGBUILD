# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=synk-git
pkgver=20101120
pkgrel=1
pkgdesc="A cross platform threading library"
arch="any"
url="https://github.com/mnmlstc/synk"
license=('BSD')
makedepends=('git' 'cmake>=2.8')

_gitroot="git://github.com/mnmlstc/synk.git"
_gitname="synk"

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

	mkdir build; cd build
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
	make install
	install -Dm0664 ../License.md \
		$pkgdir/usr/share/licenses/$pkgname/License.md
}
