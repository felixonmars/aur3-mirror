pkgname="openjpeg-svn"
pkgver=954
pkgrel=1
pkgdesc="An open source JPEG 2000 codec"
arch=('i686' 'x86_64')
url="http://www.openjpeg.org/"
license=('BSD')
depends=('glibc')
makedepends=('subversion')
provides=('openjpeg')
replaces=('openjpeg')
source=()
md5sums=()

_svntrunk=http://openjpeg.googlecode.com/svn/trunk
_svnmod=openjpeg

build() {
  cd $startdir/src
  msg "Connecting to SVN server..."
  [ -d $_svnmod/.svn ] && {
    cd $_svnmod
    svn up -r $pkgver
    cd ..
  } || {
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  }

  cd $_svnmod

  ./bootstrap.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/openjpeg"
  cp LICENSE "${pkgdir}/usr/share/licenses/openjpeg/LICENSE" || return 1
  chmod 644 "${pkgdir}/usr/share/licenses/openjpeg/LICENSE" || return 1
}
