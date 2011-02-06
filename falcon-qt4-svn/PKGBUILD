# Contributor: Abdallah Aly < l3thal8 @gmail.com>
pkgname=falcon-qt4-svn
pkgver=1
pkgrel=1
pkgdesc="the QT4 module for Falcon proramming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
arch=(i686 x86_64)
makedepends=('cmake' 'subversion')
depends=('falcon' 'qt')
provides=('falcon-qt4')

_svntrunk=svn://falconpl.org/falcon/modules/Qt4/trunk/
_svnmod=Qt4

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

  cmake . || return 1
  make || return 1
  mkdir -p $startdir/pkg/usr/lib/falcon || return 1
  make DESTDIR="$startdir/pkg/" install || return 1
  mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
  cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-qt4 || return 1

}
