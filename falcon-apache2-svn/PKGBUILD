# Contributor: Abdallah Aly < l3thal8 @gmail.com>
pkgname=falcon-apache2-svn
pkgver=90
pkgrel=1
pkgdesc="the apache2 falcon mod for running falcon web pages"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
arch=(i686 x86_64)
makedepends=('cmake' 'subversion')
depends=('falcon' 'apache')
provides=('falcon-apache2')

_svntrunk=svn://falconpl.org/falcon/projects/falcon-apache2/trunk/
_svnmod=falcon-apache2

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

  cmake -DAPACHE_REAL_INCLUDE_DIR=/usr/include/httpd/ . || return 1
  make || return 1
  mkdir -p $pkgdir/usr/lib/httpd/modules/
  cp $srcdir/$_svnmod-build/mod_falcon.so $pkgdir/usr/lib/httpd/modules/
  mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
  cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-apache2 || return 1

}
