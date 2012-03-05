# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=wippien
pkgver=2.5.1
pkgrel=1
pkgdesc="Establish direct P2P (peer to peer) VPN between each jabber-contact"
arch=('i686' 'x86_64')
url="http://wippien.com/"
license=('GPL')
if [ $CARCH == i686 ]; then
  depends=('openssl098')
elif [ $CARCH == x86_64 ]; then
  depends=('lib32-openssl098' 'lib32-gcc-libs')
fi
source=("${url}/download/wiplinux.tgz")
md5sums=('dadeac690895902dad34238bc552f9e9')

package() {
  cd "${srcdir}"
  install -d -m644 "${pkgdir}/usr/bin"
  install -m755 wipclnt "${pkgdir}/usr/bin/wipclnt"
  install -m755 wiptun "${pkgdir}/usr/bin/wiptun"
}
