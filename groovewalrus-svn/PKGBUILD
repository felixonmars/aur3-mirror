# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=groovewalrus-svn
pkgver=344
pkgrel=1
pkgdesc="Music Player with GrooveShark and Last.fm support"
arch=('any')
url="http://groove-walrus.turnip-town.net"
license=('GPL2')
depends=('mplayer' 'python2-pymedia' 'wxpython2.8')
makedepends=('subversion')
conflicts=('groovewalrus')
source=($pkgname::svn+http://turnip-town.googlecode.com/svn/trunk)
md5sums=('SKIP')

pkgver() {
  svnversion $srcdir/$pkgname | tr -d [A-z]
}

prepare() {
  cd $srcdir/$pkgname  

  # Make Groovewalrus work with wxpython2.8
  find . -iname '*.py' -exec sed -i -e "s|^import wx|import wxversion\nwxversion.select('2.8')\nimport wx|" '{}' +
}

package() {
  cd $srcdir

  # Executable in path
  install -Dm755 ../groovewalrus $pkgdir/usr/bin/groovewalrus

  # Desktop Icon
  install -Dm644 ../groovewalrus.desktop $pkgdir/usr/share/applications/groovewalrus.desktop
  cd $pkgname
  install -Dm644 groovewalrus/gw7.ico $pkgdir/usr/share/pixmaps/gw7.ico

  # Program files
  cp -r groovewalrus/ $pkgdir/usr/share
}