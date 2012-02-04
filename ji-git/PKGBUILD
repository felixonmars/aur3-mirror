# Maintainer: Ramil Farkshatov <ramil@gmx.co.uk>
pkgname=ji-git
pkgver=20110414
pkgrel=1
pkgdesc="A minimalist FIFO and filesystem-based XMPP client."
arch=(i686 x86_64)
url="http://iris-comp.ru/~ramil"
license=('GPL')
depends=('polarssl')
makedepends=('git' 'libxmpps')
provides=('ji')
conflicts=('ji')

_gitroot="http://iris-comp.ru/public/git/ji.git"
_gitname="ji"

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
  make prefix="/usr" destdir="$pkgdir/" install
} 
