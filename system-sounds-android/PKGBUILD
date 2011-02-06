# Contributor:	Christoph Zeiler	<moonblade.org: archNOSPAM>
# Maintainer:	Jesse Jaara		<gmail.com: jesse.jaara>

pkgname=system-sounds-android
pkgver=20110104
pkgrel=1
pkgdesc="A free system sound package for system events and notifications"
arch=('i686' 'x86_64')
url="http://freepats.zenvoid.org/system-sounds/"
license=('APACHE')
source=(http://huulivoide.pp.fi/Arch/android.tar.xz)

build() {

  mkdir -p "$pkgdir/usr/share/sounds"
  cp -rf android "$pkgdir/usr/share/sounds/"
}
md5sums=('bccd76512bca4d400e4f7d486ffb043c')
