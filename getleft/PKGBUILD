# Contributor: Jean Azzopardi <aragorn@waldonet.net.mt>
pkgname=getleft
pkgver=1.2
pkgrel=2
options=(!strip)
pkgdesc="Downloads complete websites, given a URL"
arch=(i686)
url="http://personal1.iddeo.es/andresgarci/getleft/english/index.html"
license=('GPL2')
depends=('libxft' 'libxss')
source=(http://prdownloads.sourceforge.net/getleftdown/Getleft-v${pkgver}-x86.tar.gz)
md5sums=('50fcfd594e98c7fae97cb473380b42ca')

build() {
  cd "$startdir"
  install -Dm 755 "${srcdir}/Getleft-v${pkgver}-x86/Getleft" "${pkgdir}/usr/bin/getleft"
}
