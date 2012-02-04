# Contributor: b9anders <b9anders@gmail.com>
pkgname=bin32-gsopcast-svn
pkgver=56
pkgrel=1
pkgdesc="A GTK front-end of p2p TV sopcast for 64-bit only."
arch=('x86_64')
url="http://code.google.com/p/gsopcast/"
license=('GPL') 
depends=('bin32-sopcast' 'gtk2' 'cairo' 'alsa-lib' 'intltool' 'gnome-common')
makedepends=('pkgconfig')

_svnmod="gsopcast"
_svntrunk=http://gsopcast.googlecode.com/svn/trunk/


build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
  (cd $_svnmod && svn up -r $pkgver)
  else
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}