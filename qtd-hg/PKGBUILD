pkgname=qtd-hg
pkgver=20100814
pkgrel=1
pkgdesc="Bindings of Qt GUI library to D programming language"
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/qtd"
license=("Boost")
depends=('dmd2' 'libphobos2' 'qt')
makedepends=('mercurial')
provides=('qtd')
conflicts=('qtd')
options=('!makeflags')

_hgrepo=http://hg.dsource.org/projects/qtd/
_hgmod=qtd

build() {
  
  if [ -d $_hgmod/.hg ]; then
    (cd $_hgmod && hg pull )
  else
    hg clone $_hgrepo $_hgmod
  fi

  msg "hg checkout done or server timeout"

  cd $srcdir/$_hgmod

  # enter build directory
  if [ -d build_dir ]; then
    cd build_dir
  else
    mkdir build_dir
    cd build_dir
  fi

  # overwrite makepkg.conf flags as those may kill the compile -.-
  unset CFLAGS
  unset CXXFLAGS

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../

  make || return 1
  DESTDIR=${pkgdir} make install || return 1
}

