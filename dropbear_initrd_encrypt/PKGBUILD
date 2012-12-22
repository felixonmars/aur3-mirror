# Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: allspark
pkgname=dropbear_initrd_encrypt
pkgver=0.11
pkgrel=1
pkgdesc="Allows for an encrypted root device to be unlocked remotely over SSH"
arch=('any')
url="https://gitorious.org/johnpatcher/dropbear_initrd_encrypt"
license=('GPL3')
depends=('dropbear' 'cryptsetup' 'mkinitcpio-nfs-utils' 'psmisc' 'iproute2')
install=$pkgname.install
source=('ChangeLog' 'dropbear_hook' 'dropbear_install' 'encryptssh_hook' 'encryptssh_install' "$pkgname.install")
changelog='ChangeLog'
md5sums=('2a98952e396b56f5746312970bdbc413'
         '9e092625f73e1d457c383b70b6ec58c6'
         'b4794a90d3fb57e4f5a4631899cd31cb'
         '212e9cfdbd9376d671d6e4eb6d801d12'
         '722a2bb1d2857a630173e7c00e8a518b'
         'f6bc85cc20e591b6aebf68e9b43a0c2d')

build() {
  install -Dm644 "$srcdir/dropbear_hook"      "$pkgdir/usr/lib/initcpio/hooks/dropbear"
  install -Dm644 "$srcdir/dropbear_install"   "$pkgdir/usr/lib/initcpio/install/dropbear"
  install -Dm644 "$srcdir/encryptssh_hook"    "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/encryptssh_install" "$pkgdir/usr/lib/initcpio/install/encryptssh"
}
