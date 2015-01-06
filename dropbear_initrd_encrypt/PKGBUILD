# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: johnpatcher
# Contributor: chadversary
# Contributor: allspark
pkgname=dropbear_initrd_encrypt
pkgver=0.14
pkgrel=1
pkgdesc="Allows for an encrypted root device to be unlocked remotely over SSH"
arch=('any')
url="https://github.com/grazzolini/dropbear_initrd_encrypt.git"
license=('GPL3')
depends=('dropbear' 'cryptsetup' 'mkinitcpio-nfs-utils' 'psmisc' 'iproute2')
install=$pkgname.install
source=('ChangeLog' 'dropbear_hook' 'dropbear_install' 'encryptssh_hook' 'encryptssh_install' "$pkgname.install")
changelog='ChangeLog'
sha256sums=('939449709edc3a08520a041d1b76d1c0f3170285282911b8a48457adf18b0aae'
         '1f4b00e8dd25dfd0c2afbca50de6bfe39c00231c9d5424bbb38fe0b340742274'
         '5134ae6e28e67aae5cc88eb0528c6e122c139ca2f0205671567b32b64fa04f21'
         'ce2a8e85df788b1286201f284e14ebd939a01763ea4668b0fa9dfa6da0e4776c'
         '3694f140d4a6a3e1884100e166deffef7ce81d317fa174bca3d63e0e48daed2c'
         '602316b3e5be318cd1a199e0524a235a6a3a4cc61f3ceb6f0c9b14e69634387d')

package() {
  install -Dm644 "$srcdir/dropbear_hook"      "$pkgdir/usr/lib/initcpio/hooks/dropbear"
  install -Dm644 "$srcdir/dropbear_install"   "$pkgdir/usr/lib/initcpio/install/dropbear"
  install -Dm644 "$srcdir/encryptssh_hook"    "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/encryptssh_install" "$pkgdir/usr/lib/initcpio/install/encryptssh"
}
