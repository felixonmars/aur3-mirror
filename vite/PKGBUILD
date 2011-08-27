# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
 
pkgname=vite
pkgver=1.2
pkgrel=1
revision=1157
pkgdesc="Visual Trace Explorer (VITE)"
arch=('any')
url="http://vite.gforge.inria.fr"
license=('CeCILL-A')
makedepends=('make')
optdepends=()
source=(https://gforge.inria.fr/frs/download.php/27457/vite_$revision.tar.gz)
sha1sums=('99c4a0c3a829b07ee918d5cacacb767fe14649e8')
 
build() {
  cd "vite_$revision"
  ./configure --disable_otf --disable_tau
  #cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DVITE_ENABLE_OTF=false -DVITE_ENABLE_TAU=false .
  make

  mkdir -p $pkgdir/usr/bin
  install -m 755 bin/vite $pkgdir/usr/bin/vite
}

