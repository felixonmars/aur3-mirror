# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dreamweb-es
pkgver=1.1
pkgrel=1
pkgdesc="A top-down adventure game set in a gritty futuristic dystopian city - spanish language"
arch=('any')
url="http://www.scummvm.org/"
license=('custom: Freeware')
depends=('scummvm')
options=('!strip')
source=(http://downloads.sourceforge.net/scummvm/dreamweb-cd-es-$pkgver.zip
        $pkgname.sh)
sha256sums=('1f10045952d2348d2775c05c0b95ff4f35c60d6e9be109893157ef63d4444803'
            '7b64aa5833315037ac8855a60a7a3c49b5b9be333a28a82377865f8672480c24')

package() {
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # data
  install -d "$pkgdir"/usr/share/$pkgname/spanish
  install -m644 DREAMW*.* "$pkgdir"/usr/share/$pkgname
  install -m644 track1.flac "$pkgdir"/usr/share/$pkgname
  install -m644 SPANISH/*.RAW "$pkgdir"/usr/share/$pkgname/spanish
  rm "$pkgdir"/usr/share/$pkgname/DREAMWSP.EXE

  # license
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
