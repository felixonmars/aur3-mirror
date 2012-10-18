# Maintainer: AlexanderR <alexander r at gmx com>

pkgname=mdev
pkgver=0.1
pkgrel=1
pkgdesc="Alternative hotplug manager to udev. THIS IS ALPHA VERSION. Nothing works except for passing initramfs passing. DO NOT REMOVE UDEV YET."
arch=('any')
url="http://www.archlinux.org/"
license=('GPL')
# who knows, what evil things they can do
depends=('busybox=1.20.2-1' 'mkinitcpio=0.10')
#conflicts=('udev' 'systemd-tools')
source=('mdev-install' 'mdev-hook')
sha256sums=('c13b5ef0e7b0eb86f24d90917d1061494741c050a62b3a928c9b7373bdd02c0a'
            '8c82e4ab445048e563dc253f722e0a07e3850406f064d38f72d40fb83cd5f2da')

package() {
  install -Dm644 mdev-install "$pkgdir"/usr/lib/initcpio/install/mdev
  install -Dm644 mdev-hook "$pkgdir"/usr/lib/initcpio/hooks/mdev
}

