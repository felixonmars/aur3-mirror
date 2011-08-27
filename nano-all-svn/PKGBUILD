# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=nano-all-svn
pkgver=svn
pkgrel=1
pkgdesc="Pico editor clone with enhancements (SVN)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.nano-editor.org"
depends=('glibc' 'ncurses')
makedepends=('texinfo' 'subversion' 'cvs')
source=()
backup=('etc/nanorc')
provides=('nano')
conflicts=('nano')
md5sums=()

_svntrunk=svn://svn.savannah.gnu.org/nano/trunk/nano
_svnmod=nano

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  # clean (no .svn files everwyhere)
  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build

  cd $_svnmod-build

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-all --enable-color --enable-nanorc --enable-utf8 --enable-multibuffer
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  install -DTm644 $startdir/src/$_svnmod-build/doc/nanorc.sample $startdir/pkg/etc/nanorc
}
