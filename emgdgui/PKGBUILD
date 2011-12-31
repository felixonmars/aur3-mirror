# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=emgdgui
pkgver=1.8.0
pkgrel=4
pkgdesc="Intel EMGD drivers GUI"
arch=('i686')
license=('custom')
url="http://edc.intel.com/Software/Downloads/EMGD/"
depends=('libxext' 'libstdc++5' 'gtk2' 'libglade' 'gdk-pixbuf2' 'libdrm' 'xproto' 'libxrandr' 'libx11' 'libpciaccess' 'dkms-emgd' 'xf86-video-emgd')
source="https://launchpad.net/~gma500/+archive/emgd110/+files/${pkgname}_${pkgver}.orig.tar.gz"
md5sums=('501779587f320c18d183b4522b0bd272')

package() {
     cd ${srcdir}
     install -Dm755 emgdgui ${pkgdir}/usr/bin/emgdgui
     install -Dm755 emgd_crg ${pkgdir}/usr/bin/emgd_crg
} 
