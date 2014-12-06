# Maintainer: Zachary Jaggi <feilen1000@gmail.com>

pkgver=0.4.3
pkgrel=1
pkgname='oculus-wine-wrapper'
pkgdesc='A wrapper to allow you to run Oculus Rift Windows games in Wine'
arch=('x86_64')
url='https://jspenguin.org'
license=('GPL2')
depends=('oculus-rift-sdk-jherico-git'
		 'wine')
optdepends=('oculus-udev: Rules to let users access the Oculus Rift')
options=('!emptydirs')
source=('https://jspenguin.org/software/ovrsdk/files/oculus_wine_wrapper.tar.gz'
		'oculus_wine_wrapper.sh')
sha256sums=('4bcf2c1484bb77df310059e5a7ab403cf890c08c955f989936fd16f4f7e7c16b'
            'caf607288e8294dce298074b138786563d22bb811fc3c611869298f175d31002')
package() {
  cd ${srcdir}/oculus_wine_wrapper

  install -dm 755 ${pkgdir}/usr/share/oculus-wine-wrapper
  install -dm 755 ${pkgdir}/usr/bin

  install -m 755 oculus_shm_adapter.exe ${pkgdir}/usr/share/oculus-wine-wrapper/oculus_shm_adapter.exe
  install -m 755 no_xselectinput.so ${pkgdir}/usr/share/oculus-wine-wrapper/no_xselectinput.so

  install -m 755 ${srcdir}/oculus_wine_wrapper.sh ${pkgdir}/usr/bin/oculus-wine-wrapper
}
