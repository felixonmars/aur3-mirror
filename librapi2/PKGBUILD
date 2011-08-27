# Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=librapi2
pkgver=0.15
pkgrel=3
pkgdesc="A SynCE library file"
arch=('i686' 'x86_64')
url="http://www.synce.org/moin/"
license=('custom')
options=('!libtool')
depends=('synce-libsynce')
source=(http://downloads.sourceforge.net/synce/SynCE/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=(7341571d6f6b583bb4837bae42fb5d1c)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make 
}
package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make DESTDIR="${pkgdir}/" install
}
