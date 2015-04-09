# Maintainer: Ettore Chimenti <ek5.chimenti @ gmail.com>
pkgname="init-headphone"
pkgver="0.2.0"
pkgrel=3
epoch=
pkgdesc="Re-enables headphone jack after sleep/suspend resume on Clevo W230SS"
arch=("any")
url="https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1313904/"
license=('GPL')
depends=("dmidecode" "python2-smbus" "python")
install=init-headphone.install
source=("https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1313904/+attachment/4361090/+files/${pkgname}_${pkgver}_all.deb"
        "init-headphone.service"  
        "init-headphone.install")
noextract=()
md5sums=('37c830340c4ca077271a04b4436ea8fc'
         'ad3ad6f4c9157035fd7a9dd2e82184c2'
         '81b2f5e44cd18753e64a084eaff563b5')
validpgpkeys=()

package() {
  tar -xf data.tar.xz

  install -Dm 755 usr/sbin/init-headphone  $pkgdir/usr/bin/init-headphone 

  install -Dm 755 {,$pkgdir/}etc/modules-load.d/init-headphone.conf  

  install -Dm 755 init-headphone.service  $pkgdir/usr/lib/systemd/system/init-headphone.service  
}


