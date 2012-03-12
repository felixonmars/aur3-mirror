# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=x2goagent-git
pkgver=20120312
pkgrel=1
pkgdesc="X proxy server for x2go"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('freetype2' 'nxcompext-x2go-git' 'nxcompshad-x2go-git'
         'libxcomposite' 'libxpm')
conflicts=('x2goagent')
source=('x2go.xpm'
        'x2goagent')
md5sums=('d4aef9537add1e370e50fd2d73ba3ebe'
         'f11e5748c4f7504f2eb570fce9372d76')

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
  cd "$srcdir/$_gitname-build/"
  patch -p1 < debian/patches/006_nxcomp_libpng15.full+lite.patch
  cd nx-X11

  make World
}

package() {
  cd "$srcdir/$_gitname-build/"

  install -m 755 -D "nx-X11/programs/Xserver/nxagent" "$pkgdir/usr/lib/nx/nxagent"
  install -m 755 -d "$pkgdir/usr/lib/x2go/"
  ln -s ../nx/nxagent "$pkgdir/usr/lib/x2go/x2goagent"

  install -m 755 -d "$pkgdir/usr/share/x2go"
  install -m 644 debian/rgb "$pkgdir/usr/share/x2go/rgb"

  install -m 755 -d "$pkgdir/usr/share/pixmaps"
  install -m 644 "$srcdir/x2go.xpm" "$pkgdir/usr/share/pixmaps/x2go.xpm"

  install -m 755 -D "$srcdir/x2goagent" "$pkgdir/usr/bin/x2goagent"
}
