# Maintainer: Eric Mrak <mail 'at' ericmrak 'dot' info>

pkgname=vidyo-desktop2
pkgver=2.2.1.00419
pkgrel=1
pkgdesc='Desktop client for vidyo conferencing system used at CERN (2.x series). Fix for Ubuntu check included.'
url='https://vidyoportal.cern.ch'
arch=('x86_64')
depends=('libpng12' 'pulseaudio')
makedepends=('rpmextract')
license=('proprietary')

source=('http://information-technology.web.cern.ch/sites/information-technology.web.cern.ch/files/VidyoDesktopInstaller-sl564-TAG_VD_2_2_1_00419.rpm'
        totally_ubuntu.c
        ubuntu-lsb-release
        VidyoDesktop)

md5sums=('f393ad017853b84f1e2da230ab3643d6'
         '34233f193104e834096f68aab1a1867a'
         'a5b55e4f6ceb3c67a338699916cceacf'
         'ef7e4d23d4ed388f9e970ec447f3879a')

build() {
  cd "${srcdir}"
  
  mkdir ext
  (cd ext && rpmextract.sh "${srcdir}"/VidyoDesktopInstaller-sl564-TAG_VD_2_2_1_00419.rpm)
  gcc -fPIC -shared -Wl,-soname,totally-ubuntu.so -o totally_ubuntu.so totally_ubuntu.c
}

package() {
  msg2 "Moving files to package"
  cp -av "${srcdir}/ext"/* "${pkgdir}"
  cp -v "${srcdir}/"{totally_ubuntu.so,ubuntu-lsb-release} "${pkgdir}/opt/vidyo/VidyoDesktop"
  cp -v "${srcdir}/VidyoDesktop" "${pkgdir}/usr/bin/"
}
