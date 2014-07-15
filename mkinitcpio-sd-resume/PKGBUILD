# Maintainer: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=mkinitcpio-sd-resume
pkgver=1
pkgrel=2
pkgdesc="A hook for resuming hibernation with systemd on initramfs"
url="https://www.archlinux.org/"
arch=('any')
license=('GPL')
depends=('systemd' 'mkinitcpio')
source=(sd-resume
        systemd-resume-setup.service
        resume-setup)
md5sums=('ba2b2eee6757b382698922b8f09c1338'
         'ecbf9656922126a9c704c0ab70b0ad89'
         '863556a6c5fb3a91ffa6892e3e861523')

package() {
  install -Dm644 "$srcdir"/sd-resume "$pkgdir"/usr/lib/initcpio/install/sd-resume
  install -Dm644 "$srcdir"/systemd-resume-setup.service "$pkgdir"/usr/lib/systemd/system/systemd-resume-setup.service
  install -Dm744 "$srcdir"/resume-setup "$pkgdir"/usr/lib/systemd/scripts/resume-setup
}

# vim:set ts=2 sw=2 et:
