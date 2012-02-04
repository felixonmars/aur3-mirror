# Contributor:	Christoph Zeiler	<moonblade.org: archNOSPAM>
# Maintainer:	Jesse Jaara		<gmail.com: jesse.jaara>

pkgname=system-sounds-hildon
pkgver=20110104
pkgrel=1
pkgdesc="A free system sound package for system events and notifications"
arch=('any')
url="http://freepats.zenvoid.org/system-sounds/"
license=('CCPL:cc-by')
source=(http://huulivoide.pp.fi/Arch/hildon.tar.xz)

build() {

  mkdir -p "$pkgdir/usr/share/sounds"
  cp -rf hildon "$pkgdir/usr/share/sounds/"
}
md5sums=('056775c00f4777c95812ed7ebdf0f759')
