# Maintainer: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus-svn
pkgver=674
pkgrel=1
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://lenmus.org/"
license=('GPL')
depends=('timidity++' 'portmidi' 'freetype2' 'wxgtk' 'sqlite3')
makedepends=('subversion')
optdepends=()
provides=('lenmus')
conflicts=('lenmus')
backup=()
options=()

_svntrunk=https://lenmus.svn.sourceforge.net/svnroot/lenmus/trunk
_svnmod=lenmus

build() {
  cd $srcdir
  
  if [ -d ${_svnmod}/.svn ]; then
      (cd ${_svnmod} && svn up -r ${pkgver})
  else
      svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  ./configure --prefix=/usr
  
  make || return 1
}

package() {
  cd $srcdir/${_svnmod}-build
  make DESTDIR="$pkgdir" install
  
  rm -rf $srcdir/${_svnmod}-build
}
