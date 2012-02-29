pkgname=joggler-xorg-conf
pkgver=0.1
pkgrel=1
pkgdesc="Xorg configuration for O2 Joggler"
url="http://edc.intel.com/Software/Downloads/EMGD/"                                                                                                                                                                                                                            
arch=('i686')
license=('custom')
depends=('dkms-emgd' 'xf86-video-emgd')
source=(20-joggler.conf)
md5sums=('f12fcb41b662f95d8ab4050504ea3d0e')

package() {
    install -d "${pkgdir}"/etc/X11/xorg.conf.d/
    install -Dm644 "${srcdir}"/20-joggler.conf "${pkgdir}"/etc/X11/xorg.conf.d/
}
