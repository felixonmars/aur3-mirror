
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>
pkgname=qubes-vm-kernel-builder
pkgver=1
pkgrel=1
epoch=
pkgdesc="Kernel building scripts for Qubes OS"
arch=(x86_64)
url="http://qubes-os.org"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(qubes qubes-modules install-qubes build-qubes-initramfs.sh mkinitcpio.conf)
noextract=()

build() {
  echo "Nothing to build"
}

package() {
  install -D $srcdir/qubes $pkgdir/usr/lib/initcpio/hooks/qubes
  #install -D $srcdir/qubes-modules $pkgdir/usr/lib/initcpio/hooks/qubes-modules
  install -D $srcdir/install-qubes $pkgdir/usr/lib/initcpio/install/qubes
  #install -D $srcdir/install-qubes $pkgdir/usr/lib/initcpio/install/qubes-modules

  install -D $srcdir/mkinitcpio.conf $pkgdir/usr/share/qubes/mkinitcpio.conf
  install -D -m 755 $srcdir/build-qubes-initramfs.sh $pkgdir/usr/bin/build-qubes-initramfs.sh
}

md5sums=('efb7a0cc2cc4fafa88848be25ccdbd3c'
         '23f5e985922a8dbd4dbdf6282d0287aa'
         '7ee0ae5b776f0df4920ea1d7ad32bdd1'
         'e18fa214890264ed614c19cfc15fb8a2'
         '4d9e8db2e453f02ffce82ea5212208ca')

# vim:set ts=2 sw=2 et:
