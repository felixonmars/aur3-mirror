pkgname=dropbear_initrd_encrypt
pkgver=0.9
pkgrel=3
pkgdesc="provides SSH access in initrd to enter root luks passphrase "
arch=(i686 x86_64)
url="https://mw.vc/2009/08/08/luks-pass-over-ssh-archlinux/"
license=('GPL')
depends=('dropbear' 'cryptsetup' 'mkinitcpio-nfs-utils' 'psmisc' 'iproute2')
install=$pkgname.install
source=(dropbear_hook dropbear_install encryptssh_hook encryptssh_install)
md5sums=('1ffcec1d8e9227f65f79836626ffe453'
         'e8a804fe750e3d700bb12cb784ccc54e'
         '39dd7d75248c3cb4ea624dc72a8b5459'
         '9a7131698d0eb2840619202780adec85')
backup=('usr/lib/initcpio/hooks/dropbear'
        'usr/lib/initcpio/hooks/encryptssh'
        'usr/lib/initcpio/install/dropbear'
        'usr/lib/initcpio/install/encryptssh')

build() {
  install -Dm644 "$srcdir/dropbear_hook"      "$pkgdir/usr/lib/initcpio/hooks/dropbear"
  install -Dm644 "$srcdir/dropbear_install"   "$pkgdir/usr/lib/initcpio/install/dropbear"
  install -Dm644 "$srcdir/encryptssh_hook"    "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/encryptssh_install" "$pkgdir/usr/lib/initcpio/install/encryptssh"
}
