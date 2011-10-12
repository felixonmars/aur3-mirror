# Maintainer:  Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Addict7 <nicolasfloquet@gmail.com> 
# Contributor: liquibyte <liquibyte@gmail.com>
pkgname=geany-svn
pkgver=6018
pkgrel=2
pkgdesc="A fast and lightweight IDE"
arch=('i686' 'x86_64')
url="http://geany.uvena.de"
license=('GPL')
depends=('gtk2' 'libtool' 'gettext')
makedepends=('subversion' 'intltool' 'autoconf' 'automake')
provides=('geany' 'geany=0.21')
conflicts=('geany')

source=()
md5sums=()

_svntrunk=https://geany.svn.sourceforge.net/svnroot/geany/trunk
_svnmod=geany

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
  make CFLAGS="$CFLAGS -DGEANY_DISABLE_DEPRECATED"  || return 1
  make DESTDIR=$startdir/pkg/ install
  sed -i 's|Sh=|Sh=PKGBUILD;|' $startdir/pkg/usr/share/geany/filetype_extensions.conf
  
  rm -rf $startdir/src/$_svnmod-build
}
