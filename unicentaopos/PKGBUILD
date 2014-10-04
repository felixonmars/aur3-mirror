# Maintainer: CPUnltd <cpunltd[at]gmail[dot]com>
# Thank you to those who helped me figure this pkgbuild out and get it up and running! 
# Thanks go out to benpyt7, demize, cinelli, holomorph and Earnestly from the IRC channel!
pkgname=unicentaopos
pkgver=3.56
pkgrel=1
pkgdesc="uniCenta oPOS is a point-of-sale system capable of running on displays from 800x600 upwards. Able to run single terminal or multi-location, multi-terminal on a range of proven commercial grade databases such as MySQL, HSQL, PostgreSQL and Oracle."
url="http://www.unicenta.com"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('jdk')
optdepends=('mysql' 'postgresql')
makedepends=()
conflicts=()
replaces=()
backup=()
options=('!strip')
source=("http://downloads.sourceforge.net/project/unicentaopos/app/Linux/unicentaopos-3.56-linux-installer.run"
        "unicenta.setup"
        "unicenta.desktop"
	"unicenta.png"
	"README_First.txt"
	"RN_356.txt")
md5sums=('917095a5f02193218bcd3d850960be41'
         'c65756eaf9801dec1fc0bf2ba7c19871'
         '93d764673b8b67e25a214858d6c960f9'
         '102e40e19a7eed2b3e633a5099537c9a'
         'faf5c7f35a672a84b254410b62856aba'
         'b80c1e51420ffffb54571b2687325635')

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/opt/${pkgname}/
  mkdir -p $pkgdir/usr/bin
  install -Dm755 ${pkgname}-${pkgver}-linux-installer.run $pkgdir/opt/${pkgname}/${pkgname}-${pkgver}-linux-installer.run
  install -Dm644 unicenta.desktop $pkgdir/usr/share/applications/unicenta.desktop
  install -Dm644 unicenta.png $pkgdir/usr/share/pixmaps/unicenta.png
  install -Dm644 README_First.txt $pkgdir/opt/${pkgname}/README_First.txt
  install -Dm644 RN_356.txt $pkgdir/opt/${pkgname}/RN_356.txt
  install -Dm755 unicenta.setup $pkgdir/usr/bin/unicenta.setup
}
