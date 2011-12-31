# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=nxproxy-x2go-git
pkgver=20111230
pkgrel=1
pkgdesc="NX compression proxy"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('nx-x11-git')
conflicts=('nxproxy')

_pkgname="${pkgname%-x2go-git}"
_gitname="nx-libs"
_gitroot="git://code.x2go.org/$_gitname.git"

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
  cd "$srcdir/$_gitname-build/$_pkgname"

  ./configure --prefix=/usr
  make LDFLAGS="-L/usr/lib/nx"
}

package() {
  cd "$srcdir/$_gitname-build/$_pkgname"

  install -m 755 -d "$pkgdir/usr/bin/"
  install -m 755 nxproxy "$pkgdir/usr/bin/"
}
