# Contributor:  Steven She <mintcoffee@gmail.com>
pkgname=superswitcher-svn
pkgver=37
pkgrel=1
pkgdesc="A more featureful replacement of the Alt-Tab window switching behavior.\
This will checkout and package the latest SVN version."
arch=(i686 x86_64)
license="GPL"
url="http://code.google.com/p/superswitcher/"
depends=('gconf' 'libwnck')
makedepends=('automake' 'autoconf' 'intltool' 'subversion')
provides=('superswitcher')
source=()
md5sums=()
_svntrunk=http://superswitcher.googlecode.com/svn/trunk/ 
_svnmod=superswitcher-read-only

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install

  rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh
