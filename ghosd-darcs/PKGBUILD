# Contributor: palbo <quuxbaz@gmail.com>

pkgname=ghosd-darcs
pkgver=20090215
pkgrel=1
pkgdesc="on-screen display (OSD) with transparency"
arch=('i686' 'x86_64')
url="http://neugierig.org/software/ghosd/"
license=('MIT')
depends=('cairo' 'pango' 'gtk-doc')
makedepends=('darcs' 'patch')
conflicts=('ghosd')
provides=('ghosd')
source=(configure.patch)
md5sums=('38c825de69a380925946ff257e025fad')

_darcstrunk="http://neugierig.org/software/darcs"
_darcsmod="ghosd"

build() {
  cd $srcdir
  if [[ -d $_darcsmod/_darcs ]]
  then
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
    cd $_darcsmod
  fi

  rm -r $srcdir/$_darcsmod-build
  cp -r $srcdir/$_darcsmod $srcdir/$_darcsmod-build
  cd $startdir/src/$_darcsmod-build

  sed -i 's/aclocal-1.9/aclocal/g' autogen.sh
  sed -i 's/automake-1.9/automake/g' autogen.sh
  patch -Np1 < $srcdir/configure.patch

  sh autogen.sh
  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
