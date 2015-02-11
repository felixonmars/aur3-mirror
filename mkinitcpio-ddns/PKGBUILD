# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-ddns
pkgver=0.0.1
pkgrel=1
pkgdesc="This hook provides dynamic dns capabilities to the initramfs. It is meant for use with dropbear_initrd_encrypt and mkinitcpio-ppp for remote unlocking the luks root partition over the internet"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-ddns"
license=('BSD')
depends=('inadyn-mt')
optdepends=('dropbear_initrd_encrypt: for setting a gateway using ip= parameter' 'mkinitcpio-ppp: dial to a provider to establish internet connection')
install=$pkgname.install
source=('ChangeLog' "$pkgname.install" 'ddns_hook' 'ddns_install')
changelog='ChangeLog'
sha256sums=('6663f33155b4640f113539562fc7381583ae0e42ff680ee9425eae9ecd2dd7d0'
            'f967435d494ec9d4980df1bfd6f3ca6738ebd0e2544c4e079ce31603dea5b7f6'
            'dcfb9d012d832337892c8955db4c7039bbac9df75c98218ffc029513feb66f26'
            '011a2d4b3fd28eb16a74300bbeda158b7d60d64c3ee4e13a3ae8dbb03cd234dd')

package() {
  install -Dm644 "$srcdir/ddns_hook"      "$pkgdir/usr/lib/initcpio/hooks/ddns"
  install -Dm644 "$srcdir/ddns_install"   "$pkgdir/usr/lib/initcpio/install/ddns"
}
