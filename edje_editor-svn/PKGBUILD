# Contributor: Igor Scabini <furester at gmail.com>

pkgname=edje_editor-svn
pkgver=36978
pkgrel=1
pkgdesc="edje file editor"
arch=('i686' 'x86_64')
groups=('e17-svn')
url="http://www.enlightenment.org"
license=('BSD')
depends=('etk')
makedepends=('svn')
conflicts=('edje_editor')
provides=('edje_editor')
replaces=('edje_editor-cvs')
options=('!libtool')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/edje_editor"
_svnmod="edje_editor"

build() {
   cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
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
  make DESTDIR=$pkgdir install || return 1

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
  	$pkgdir/usr/share/licenses/$pkgname/COPYING
  	
  rm -r $startdir/src/$_svnmod-build
}
