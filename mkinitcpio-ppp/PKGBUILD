# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-ppp
pkgver=0.0.3
pkgrel=1
pkgdesc="PPP hook for dialing to a ppp connection inside the initrd. In combination with dropbear_initrd_encrypt, it allows remote unlocking over the internet"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-ppp"
license=('BSD')
depends=('ppp')
install=$pkgname.install
source=('ChangeLog' "$pkgname.install" 'ppp_hook' 'ppp_install')
changelog='ChangeLog'
sha256sums=('8ee42e5ae2170686e15c031c7e2fe2e06e1f2659ed01300717b9fdd00d18186e'
            '8b36f75be0f04a9a9c111dc710f43ed06d7e48921e2094421f923a36e0e2a9d9'
            '0290f95fcb852b001ccdaba273fc99923f3927fa711386e948baf37d04127437'
            '92bfd4ade39d1194a5f9fc6c600d9064093b91725b279c37b0a92dd3cd7f0fbf')

package() {
  install -Dm644 "$srcdir/ppp_hook"      "$pkgdir/usr/lib/initcpio/hooks/ppp"
  install -Dm644 "$srcdir/ppp_install"   "$pkgdir/usr/lib/initcpio/install/ppp"
}
