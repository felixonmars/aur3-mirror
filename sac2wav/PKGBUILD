# Maintainer: kfgz <kfgz at interia pl>

pkgname=sac2wav
pkgver=0.9.2
pkgrel=2
pkgdesc="Console application for conversion of seismic data to wav-pcm"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sac2wav/"
license=('GPL')
depends=('gcc-libs')
source=(${pkgname}-${pkgver}.tgz::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz/download)
md5sums=('545f8c05c14f05b29be15f325ae97124')

build() {
  cd ${srcdir}/sac2wav/src
  g++ sac2wav.cpp -march=native -o s2w -pipe -O2
   
  cd ${srcdir}/sac2wavm/src
  g++ sac2wavm.cpp -march=native -o s2wm -pipe -O2
}

package() {
  install -dm755 ${pkgdir}/usr/bin
  install -m755 ${srcdir}/sac2wav/src/s2w ${pkgdir}/usr/bin
  install -m755 ${srcdir}/sac2wavm/src/s2wm ${pkgdir}/usr/bin
}
