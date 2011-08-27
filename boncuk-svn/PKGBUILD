# Contributor: Samed Beyribey <ras0ir AT eventualis dot org>
pkgname=boncuk-svn
pkgver=339
pkgrel=1
pkgdesc="Turkish->English English->Turkish Dictionary"
arch=('i686' 'x86_64')
url="http://pysozluk-qt.sourceforge.net"
license=('GPL')
depends=('sqlite3')
makedepends=('qt')
provides=('boncuk')
conflicts=('boncuk')
replaces=('boncuk')
source=(http://downloads.sourceforge.net/pysozluk-qt/boncuk-dict-0.1.1.tar.bz2)
md5sums=('c02201294ec15d45549a05a9455b2811') #generate with 'makepkg -g'

_svntrunk=https://pysozluk-qt.svn.sourceforge.net/svnroot/pysozluk-qt/trunk
_svnmod=pysozluk-qt

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  qmake -o Makefile boncuk.pro
  lrelease boncuk.pro
  make || return 1
  install -D -m755 $srcdir/$_svnmod-build/bin/boncuk $pkgdir/usr/bin/boncuk
  # Offline dictionary is useful also
  install -D -m644 $srcdir/boncuk-dict-0.1.1/boncuk.db $startdir/pkg/usr/share/boncuk/boncuk.db
}
