# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-ppp
pkgver=0.0.2
pkgrel=1
pkgdesc="PPP hook for dialing to a ppp connection inside the initrd. In combination with dropbear_initrd_encrypt, it allows remote unlocking over the internet"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-ppp"
license=('BSD')
depends=('ppp')
install=$pkgname.install
source=('ChangeLog' "$pkgname.install" 'ppp_hook' 'ppp_install')
changelog='ChangeLog'
sha256sums=('b6e82c4480f63dd150a77cd4dbf02bcd1095e146b9640ba83bb71d26df68822c'
            'c0c8018ae6feee9d91f6486a0507fe492cd6105a27a208b857d8a7182a21f7f9'
            '38136b019536de061592f9d662faca55be9cc77343645aae68e3b0f3e1a8232d'
            '92bfd4ade39d1194a5f9fc6c600d9064093b91725b279c37b0a92dd3cd7f0fbf')

package() {
  install -Dm644 "$srcdir/ppp_hook"      "$pkgdir/usr/lib/initcpio/hooks/ppp"
  install -Dm644 "$srcdir/ppp_install"   "$pkgdir/usr/lib/initcpio/install/ppp"
}
