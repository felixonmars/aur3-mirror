# Contributor: Dave Reisner <d@falconindy.com>
# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>

pkgname=xf86-input-multitouch-git
pkgver=20121207
pkgrel=1
pkgdesc="A multitouch X driver using the kernel MT protocol"
arch=('any')
url="http://bitmath.org/code/multitouch/"
license=('GPL')
depends=('mtdev')
makedepends=('git' 'xorg-server-devel')
provides=('xf86-input-multitouch')
conflicts=('xf86-input-multitouch')
source=('10-multitouch.conf')
md5sums=('2bdf08d4526179bb369806d6b7b3a243')

_gitroot="http://bitmath.org/git/multitouch.git"
_gitname="multitouch"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    ( cd $_gitname && git pull origin; )
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

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/10-multitouch.conf" "$pkgdir/etc/X11/xorg.conf.d/10-multitouch.conf"
}
