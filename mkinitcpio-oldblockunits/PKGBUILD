# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=mkinitcpio-oldblockunits
pkgver=1
pkgrel=2
pkgdesc="Old pre 12.0 block units for mkinitcpio(mmc,sata,pata,scsi,usb,virtio,fw)"
arch=('any')
license=('GPLv3')
url=('http://archlinux.org')
depends=('mkinitcpio>=0.12')
install='mkinitcpio-oldblockunits.install'
source=('fw.new' 'pata.new' 'sata.new' 'scsi.new' 'mmc.new' 'usb.new' 'virtio.new')
md5sums=('47331e58b269d9a6b955fcfbc3855f89'
         'f13d97ab9e28587da7c78f3122747798'
         'f13d97ab9e28587da7c78f3122747798'
         'f13d97ab9e28587da7c78f3122747798'
         'b3bd45266897d51e43e4e747793e54b4'
         'fe23d065b1232be3e73ae94b3e619acf'
         '425453cb332838f24b42feec67f7b2c1')
sha1sums=('3178105ed08fe5b76b6d93006d5fab7117c48df5'
          '13da3db513e3a18ff5f34c7209ae6c70ad4f4c56'
          '13da3db513e3a18ff5f34c7209ae6c70ad4f4c56'
          '13da3db513e3a18ff5f34c7209ae6c70ad4f4c56'
          'c28c3a42d34762adf799dcea69aa484f86b2781e'
          '1c925edb76ed9ed0b6c9949e7589757b5bab17c5'
          '75120b0de60125d07ec09e615c4ca43ed25c60e3')
package() {
  install -dm755 "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/fw.new" "${pkgdir}/usr/lib/initcpio/install/fw.new"
  install -m644 "${srcdir}/pata.new" "${pkgdir}/usr/lib/initcpio/install/pata.new"
  install -m644 "${srcdir}/sata.new" "${pkgdir}/usr/lib/initcpio/install/sata.new"
  install -m644 "${srcdir}/scsi.new" "${pkgdir}/usr/lib/initcpio/install/scsi.new"
  install -m644 "${srcdir}/usb.new" "${pkgdir}/usr/lib/initcpio/install/usb.new"
  install -m644 "${srcdir}/mmc.new" "${pkgdir}/usr/lib/initcpio/install/mmcusb.new"
  install -m644 "${srcdir}/virtio.new" "${pkgdir}/usr/lib/initcpio/install/virtio.new"
}
