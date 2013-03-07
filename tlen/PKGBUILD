# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=tlen
pkgver=7.0.2.1
pkgrel=1
pkgdesc='Tlen IM Client.'
arch=('i686' 'x86_64')
url='http://tlen.pl/linux'
depends=('phonon' 'libxss' 'aspell')
makedepends=('chrpath')
install=tlen.install
license=('custom')

[ ${CARCH} = "i686" ] &&
_bname=tlenlinux &&
md5sums=('db984367c05598b5b94d2d51e2133fa2')

[ ${CARCH} = "x86_64" ] &&
_bname=tlenlinux64 &&
md5sums=('46fcf0fc0e12486829d0a84f58b628d6')

source=("http://j.o2.pl/idi/tlenlinux-7.0.2.1.bin")


build() {
  sh ${_bname}-${pkgver}.bin --noexec --target ./

  cd data

  # need to bother upstream to not hardcode the lib path in tlen-bin to ./tlen_libs
  # so that we won't need to install to /opt

  # need to chrpath since we move libs later
  chrpath -r /opt/tlen/tlen_libs ./plugins/* ./tlen_libs/* ./tlen-bin > /dev/null

  mkdir -p "${pkgdir}/opt/tlen"

  # install program files
  cp -r icon.png plugins tlen-bin tlen_libs "${pkgdir}/opt/tlen/"

  # install executable
  install -D "${srcdir}/tlen" "${pkgdir}/usr/bin/tlen"

  # install license
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/tlen/license"

  # install desktop file
  install -D -m644 ../tlen.desktop "${pkgdir}/usr/share/applications/tlen.desktop"
}
