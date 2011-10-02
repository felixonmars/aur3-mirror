# Maintainer: lh <jarryson AT gmail com>

pkgname=fcitx-hg
pkgver=862
pkgrel=1
pkgdesc="Free Chinese Input Toy of X - Input Method Server for X window system (XIM)"
arch=("i686" "x86_64")
license=('GPL')
url="http://code.google.com/p/fcitx"
depends=('pango' 'gtk2' 'qt' 'gtk3')
makedepends=('mercurial' 'python2' 'intltool' 'cmake')
conflicts=('fcitx' 'fcitx-utf8-svn' 'fcitx-svn')
replaces=('fcitx')
provides=("fcitx=4.1.2")
install=("$pkgname.install")

_hgrepo="fcitx"
_hgroot="http://fcitx.googlecode.com/hg"

build() {
  cd "$srcdir/$_hgrepo"
  hg revert --all --no-backup
  
  cd $srcdir/

  msg "Creating make environment..."
  
  rm -rf $srcdir/$_hgrepo-build
  mkdir -p $srcdir/$_hgrepo-build

  msg "Starting make..."
  cd $srcdir/$_hgrepo-build
  cmake ../$_hgrepo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_QT_IM_MODULE=On \
      -DENABLE_GTK2_IM_MODULE=On \
      -DENABLE_GTK3_IM_MODULE=On

  make
}
package(){
  cd $srcdir/$_hgrepo-build
  make DESTDIR=$pkgdir install
}

