# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=nxcompext-x2go-git
pkgver=20120312
pkgrel=1
pkgdesc="NX X11 protocol compression extensions library"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL2')
depends=('libx11' 'nxcomp-x2go-git')
conflicts=('nxcompext')

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
  cd "$srcdir/$_gitname-build/$_pkgname"

  install -m 755 -d "$pkgdir/usr/lib/nx/"
  install -m 644 libXcompext.so.3.5.0 "$pkgdir/usr/lib/nx/"
  ln -s libXcompext.so.3.5.0 "$pkgdir/usr/lib/nx/libXcompext.so.3"
  ln -s libXcompext.so.3.5.0 "$pkgdir/usr/lib/nx/libXcompext.so"
  install -m 644 libXcompext.a "$pkgdir/usr/lib/nx/"

  install -m 755 -d "$pkgdir/usr/include/nx/"
  install -m 644 NX*.h "$pkgdir/usr/include/nx/"
}
