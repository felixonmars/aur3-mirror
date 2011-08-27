# Maintainer: Philip Nilsson <pnilsson@nullref.se>
pkgname=hdat2
pkgver=4.8.1
pkgrel=1
pkgdesc='a program for test or diagnostics of ATA/ATAPI/SATA, SSD and SCSI/USB devices'
# It doesn't depend on the installed system.
arch=(any)
url='http://www.hdat2.com/'
license=('custom:COPYING')
depends=(syslinux grub2)
makedepends=(unrar)
install=hdat2.install
source=('http://www.hdat2.com/files/hdat2all_481.rar' '20_hdat2.sh' 'COPYING' 'hdat2.install')
md5sums=('c1358c1cb242877ee80fb261ad601224'
         'eb4d597c95fa810e6ec324363b12c1f7'
         'd7ee7118cc72895616785c737622807d'
         '490f49e906db33eada3c0b8a7d343535')

build() {
  cd "$srcdir"
  unrar e -y hdat2all_481.rar HDAT2ALL.IMG
}

package() {
  cd "$srcdir"
  install -m644 -D HDAT2ALL.IMG "$pkgdir/boot/hdat2all.img"
  install -m755 -D 20_hdat2.sh "$pkgdir/etc/grub.d/20_hdat2"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/hdat2/COPYING"
}

# vim:set ts=2 sw=2 et:
