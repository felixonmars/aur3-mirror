# Maintainer: Rorschach <wk3054@googlemail.com>
# Contributor: Rorschach <wk3054@googlemail.com>

pkgname=bass-enhanced-sound
pkgver=1.0
pkgrel=1
pkgdesc="Enhanced Soundtrack by James Woodcock for Beneath a Steel Sky"
url="http://www.jameswoodcock.co.uk/2011/11/21/my-beneath-a-steel-sky-enhanced-soundtrack-version-1-0-released-for-scummvm/"
arch=('any')
license=('custom')
depends=('bass' 'scummvm-git>=20111124')
install=bass-enhanced-sound.install
source=(bass-enhanced-sound.install http://www.jameswoodcock.co.uk/go.php?http://www.jameswoodcock.co.uk/soundtracks/bass/full175618461/bassv1_high.zip)
sha512sums=(4f11aff6766866e7b9b467f9ecc70c7c3bc2be46a1d29529322a0fc4863f33328d86d60a1f8ca5a642190abbed547658623fb59d4a7193693cccb0ed0de6234a a19529dbefad03e967430a11fc1b2726aca487536ef5e19c6174af00699eb6c2ab7169c3e69e46c327f1fc3a04d4692560ea93a1b88f5db39314b7fb99261968)

build() {
  install -dm755  $pkgdir/usr/share/bass/ || return 1
  install -dm755  $pkgdir/usr/share/licenses/bass-enhanced-sound/ || return 1
  install -Dm755 *.ogg $pkgdir/usr/share/bass/ || return 1
  install -Dm755 readme.txt  $pkgdir/usr/share/licenses/bass-enhanced-sound/ || return 1
}
