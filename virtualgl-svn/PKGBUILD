# Maintainer: Samsagax <samsagax@gmail.com>
# Contributor: FigoDaPaura <ffigoDaPaura>

pkgname=virtualgl-svn
pkgver=4670
pkgrel=1
pkgdesc="Redirects 3D commands from an OpenGL application onto a server-side 3D graphics card. SVN version"
arch=('i686' 'x86_64')
url="http://virtualgl.org"
license=('LGPL')
depends=('mesa' 'libxv' 'turbojpeg' 'libjpeg')
makedepends=('subversion' 'cmake')
provides=('virtualgl')
conflicts=('virtualgl' 'virtualgl-bin')
replaces=()
backup=()
options=()

_svntrunk='https://virtualgl.svn.sourceforge.net/svnroot/virtualgl/vgl/trunk'
_svnmod='vgl'

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/VirtualGL -DTJPEG_INCLUDE_DIR=/usr/include -DTJPEG_LIBRARY=/usr/lib/libturbojpeg.so \
    -DVGL_LIBDIR=/usr/lib -DVGL_BINDIR=/usr/bin
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make install DESTDIR="$pkgdir"

  mkdir -p "$pkgdir/opt/VirtualGL/bin"
  mv "$pkgdir"/usr/bin/glxinfo "$pkgdir/opt/VirtualGL/bin"
}
