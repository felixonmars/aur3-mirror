# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andrea Rossi <accordioner@gmail.com>
pkgname=camelot_seq
pkgver=1.3
pkgrel=2
pkgdesc="An environment for the programming and seamlessly parallel execution of Cellular Automata"
arch=(any)
url="http://staff.icar.cnr.it/spezzano/camelot/camelot.html"
license=('GPL')
groups=()
depends=(libxp mpich)
source=(http://staff.icar.cnr.it/spezzano/camelot/$pkgname.tar.gz)
md5sums=(28e017bdbdde372c2c5b4ba7877c92d7)
install=${pkgname}.install

build() {
  cd "$srcdir"
  mkdir -p usr/share/camelot_seq
  mkdir -p usr/local/
  mv cam_seq usr/local/
  mv usr ../pkg
  mkdir ../pkg/usr/bin
  cd ../pkg
  mv usr/local/cam_seq usr/local/camelot_seq
  ln usr/local/camelot_seq/camelot usr/bin/camelot
  cp usr/local/camelot_seq/macrocell.c usr/share/camelot_seq/
  echo "\$MPIR_ROOT=/opt/mpich" >> ~/.bash_profile
  echo "export MPIR_ROOT" >> ~/.bash_profile 
  export MPIR_ROOT=/opt/mpich
}


# vim:set ts=2 sw=2 et:
