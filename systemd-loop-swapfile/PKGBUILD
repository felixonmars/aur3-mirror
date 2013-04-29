# Maintainer: Gen2ly <toddrpartridge@gmail.com>
# Thanks to: aya https://bbs.archlinux.org/viewtopic.php?pid=1225244#p1225244

pkgname=systemd-loop-swapfile
_pkgname=loop-swapfile
pkgver=1.0
pkgrel=1
pkgdesc="Mount the swap file via a loop device (for use with btrfs)."
arch=('any')
url="https://btrfs.wiki.kernel.org/index.php/FAQ#Does_btrfs_support_swap_files.3F"
license=('GPL')
depends=('systemd')
install="$_pkgname".install
source=("$_pkgname".service)
md5sums=('1c16aad200c7db394dcaad1dc7520ef7')

package() {
  install -Dm644 "$_pkgname".service \
    $pkgdir/etc/systemd/system/"$_pkgname".service
}
# vim:set ts=2 sw=2 et:
