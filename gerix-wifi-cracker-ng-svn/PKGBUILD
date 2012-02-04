# Contributor: lssjbrolli <lssjbrolli@gmail.com>
pkgname=gerix-wifi-cracker-ng-svn
pkgver=14
pkgrel=2
pkgdesc="A really complete GUI for Aircrack-NG which includes useful extras, SVN version"
arch=(i686)
url="http://devel.offensive-security.com/projects/gerix-ng"
license=('GPL')
makedepends=('subversion')
provides=(gerix-wifi-cracker-ng)
conflicts=(gerix-wifi-cracker-ng)
depends=('aircrack-ng' 'xterm' 'pyqt3')
source=('gerix')
md5sums=('7994c47b2d3835f7f52d4c2ca45d1cbb')

_svntrunk=svn://devel.offensive-security.com/gerix-ng
_svnmod=gerix-ng

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
  mkdir -p $pkgdir/usr/share/$pkgname/ | return 0
  mkdir -p $pkgdir/usr/bin/ | return 0
  make 
  install -D -m755 $srcdir/gerix $pkgdir/usr/bin/
  install -D -m755 $srcdir/$_svnmod-build/gerix*.py $pkgdir/usr/share/$pkgname/ | return 0
  install -D -m644 $srcdir/$_svnmod-build/gerix*.ui $pkgdir/usr/share/$pkgname/ | return 0
  install -D -m644 $srcdir/$_svnmod-build/gerix*.ui.h $pkgdir/usr/share/$pkgname/ | return 0
  install -D -m644 $srcdir/$_svnmod-build/gerix*.png $pkgdir/usr/share/$pkgname/ | return 0
  return 0
}
