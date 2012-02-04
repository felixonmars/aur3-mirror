# Contributor: Ferrazzo Riccardo <f.riccardo87@gmail.com>
pkgname=phototagger
pkgver=1
pkgrel=2
pkgdesc="Tool that allows you to tag your photos, based on Nepomuk"
arch=(i686)
url="http://f24h.netsons.org/phototagger"
license=('GPL3')
depends=('python2' 'pyqt>=4' 'kdebase-lib>=4')
makedepends=('svn')
source=("phototagger.desktop")
md5sums=('82c752fdaea7d42419217de229bbf448')

_svnmod="phototagger"
_svntrunk="https://phototagger.svn.sourceforge.net/svnroot/phototagger"

build() {
  cd "$srcdir/"
  msg "Getting source..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Creating make environment..."
  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -r . $pkgdir/usr/share/$pkgname/
  install -D -m 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

