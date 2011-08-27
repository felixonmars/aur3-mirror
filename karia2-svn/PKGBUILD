# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Adam Lloyd <lloyda2 (at) rpi (dot) edu>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=karia2-svn
pkgver=183
pkgrel=1
pkgdesc="QT4 interface for aria2 download mananger"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/karia2"
license=('GPL')
depends=('qt' 'aria2' 'libxtst')
makedepends=('subversion')

_svntrunk=https://karia2.svn.sourceforge.net/svnroot/karia2/trunk
_svnmod=karia2

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    export LC_CTYPE="en_US.UTF-8"
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [ -d $_svnmod-build ] && rm -r $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  qmake
  sed -i 's;/opt/karia2/resume;/usr/bin/karia2-resume;' karia2.cpp
  make PREFIX=/usr
}

package() {
  cd $srcdir/$_svnmod-build
  install -Dm755 bin/karia2 $pkgdir/usr/bin/karia2
  install -d $pkgdir/usr/share/karia2/images
  install -Dm644 images/wood{background,button}.png \
    $pkgdir/usr/share/karia2/images/
}
