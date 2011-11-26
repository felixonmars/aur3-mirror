# Contributor:  Jose Negron <josenj.arch@mailnull.com>
# Maintainer: Jose Negron <josenj.arch@mailnull.com>
# Maintainer: L. Wang <lmwang@gmail.com>

pkgname=geopy-svn-reverse-geocode-branch
pkgver=84
pkgrel=1
pkgdesc="A Geocoding toolbox for Python (reserve-geocode branch)"
url="http://code.google.com/p/geopy/"
license=('MIT')
arch=(i686 x86_64)

depends=()
makedepends=(subversion setuptools)
conflicts=('geopy')
provides=('geopy')

source=()
md5sums=()

_svntrunk=http://geopy.googlecode.com/svn/branches/reverse-geocode
_svnmod=geopy

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
  fi

  cd $_svnmod
  python2 setup.py install --root=$startdir/pkg
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  mv LICENSE $startdir/pkg/usr/share/licenses/$pkgname
  find $startdir/pkg -name ".svn" -print0 | xargs -0 rm -rf > /dev/null 2>&1 

  rm -rf $startdir/src/$_svnmod-build
}

