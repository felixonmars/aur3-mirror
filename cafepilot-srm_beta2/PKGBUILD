# Maintainer: Custom Processing Unlimited <cpunltd[at]gmail[dot]com>
# Contributors: Wey (Archlinux forum user)
pkgname=cafepilot-srm_beta2
pkgname1=CafePilot_Service_Request_Monitor
pkgname2=cafepilot-srm
pkgver=3.0.0
pkgrel=1
pkgdesc="CafePilot is a cross-platform (Windows and Linux) client/server software suite that makes managing an Internet cafe of any size a breeze. This is the service request monitor program."
url="http://www.cafepilot.com"
arch=('any')
license=('GPL')
depends=('java-runtime')
# optdepends=('*')
# makedepends=()
# conflicts=()
# replaces=()
# backup=()
# install='*.install'
source=("http://sourceforge.net/projects/cafepilot/files/CafePilot%203.0.0-beta-2/CafePilot_SRM_dist.zip/download"
        "cafepilot-srm.sh")
md5sums=('ead48ac49d243c2237d9ba988335c278'
         '7b68e0499bae1ce854e880f41325fd01')

package() {
  cd "${srcdir}"
  install -Dm755 $pkgname2.sh $pkgdir/usr/bin/$pkgname2.sh
  install -Dm644 $pkgname1.jar $pkgdir/opt/$pkgname1/$pkgname1.jar
  cp -r "$srcdir"/lib/ "$pkgdir"/opt/$pkgname1/
}

# vim:set ts=2 sw=2 et:
