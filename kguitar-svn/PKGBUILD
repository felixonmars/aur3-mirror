

# Maintainer: Sergio Montesinos <sermonpe@yahoo.es>
pkgname=kguitar-svn
_pkgname=kguitar
pkgver=1012
pkgrel=2
pkgdesc="A KDE Guitar tabulature editor"
arch=(i686 x86_64)
url="http://kguitar.sourceforge.net/"
license=('GPL')
groups=()
depends=('kdelibs' 'tse3')
makedepends=('subversion' 'automoc4' 'cmake' 'docbook-xml' 'docbook-xsl')
provides=('kguitar')
conflicts=()
replaces=()
backup=()
options=()
#install=
source=(compile1012.patch)
#noextract=()
md5sums=('a143f1b49ccef4fa4ed6e4642bd06610')

_svntrunk="https://kguitar.svn.sourceforge.net/svnroot/kguitar/branches/kde4/"
_svnmod="$_pkgname"

build() {
  msg "Starting SVN checkout..."
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
  patch -Np0 -i $srcdir/compile1012.patch

  cmake  -DCMAKE_INSTALL_PREFIX=/usr .
  make

}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

