# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dreamweb-fr
pkgver=1.1
pkgrel=1
pkgdesc="A top-down adventure game set in a gritty futuristic dystopian city - french language"
arch=('any')
url="http://www.scummvm.org/"
license=('custom: Freeware')
depends=('scummvm')
options=('!strip')
source=(http://downloads.sourceforge.net/scummvm/dreamweb-cd-fr-$pkgver.zip
        $pkgname.sh)
sha256sums=('76fff0ba67f5bcf2dde9c3fb3f5d3d5c017bb0e7368d98d9deee83d1b4182d54'
            '4908b490d53dc90a33afe7ecd3d1a192b0ef14db24df7c0ca2d7748aaa957b1b')

package() {
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # data
  install -d "$pkgdir"/usr/share/$pkgname/french
  install -m644 DREAMW*.* "$pkgdir"/usr/share/$pkgname
  install -m644 track1.flac "$pkgdir"/usr/share/$pkgname
  install -m644 FRENCH/*.RAW "$pkgdir"/usr/share/$pkgname/french
  rm "$pkgdir"/usr/share/$pkgname/DREAMWFR.EXE

  # license
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
