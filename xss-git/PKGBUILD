# Maintainer: dings	<dings at umshini-wami.org>
# Contributor: Alex Griffin <griffin.aj@gmail.com>
pkgname=xss-git
pkgver=20121105
pkgrel=1
pkgdesc="A collection of small programs to compose your own screensaver or screenlocker"
arch=('i686' 'x86_64')
url="http://woozle.org/~neale/src/xss.html"
license=('GPL3')
depends=(libxss)
makedepends=('git')
groups=()
conflicts=('xss')
provides=('xss')
source=()
sha256sums=('91fdc76be1b1f8aab6c43168aeb6e6513640188fe44040157b160a2eb3756170')
_gitroot="http://woozle.org/~neale/projects/xss"
_gitname="xss"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/bin/"
  make BINDIR="$pkgdir/usr/bin/" install
  install -m644 -D README $pkgdir/usr/share/doc/$_gitname/README
}
