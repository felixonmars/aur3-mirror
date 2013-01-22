# Maintainer: Xiao-Long Chen <chillermillerlong@hotmail.com>
pkgname=sndrdp
pkgver=2.8.1
pkgrel=1
pkgdesc="A utility to generate and transmit custom DHCP/BOOTP packets"
arch=('i686' 'x86_64')
url="http://www.sound-over-rdp.com/"
license=('custom')
source=("http://www.sound-over-rdp.com/sound-over-rdp-linux-packages/${pkgname}-${pkgver}-0-i686.tar.gz"
        "http://www.sound-over-rdp.com/sound-over-rdp-linux-packages/${pkgname}-${pkgver}-0-x86_64.tar.gz")
noextract=("${pkgname}-${pkgver}-0-i686.tar.gz"
           "${pkgname}-${pkgver}-0-x86_64.tar.gz")
sha512sums=('8ce59f86e48484844ac2ef07ea9652101e75500eaa7c6bd21e28604884a4358c8cd0b0c4d7a80b02581c6a3cbb3edf05eeb530e310a3ee4cb213af06798c8a65'
            '4f82523c86e55b3344caf2423a30d9049dfbad4527c70718ce31fcf612d25f2e4a75f7030efec8d54af1d06aaafc0da98dbdaf837b7067a1e8c0345ef3c6fc91')

package() {
  cd "${srcdir}"
  tar zxvf ${pkgname}-${pkgver}-0-${CARCH}.tar.gz -C "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
