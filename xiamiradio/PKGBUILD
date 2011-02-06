# Maintainer: Sychopx <infinity.illusion AT gmail DOT com>
pkgname=xiamiradio
pkgver=0.01
pkgrel=1
pkgdesc="a Chinese online music streaming application like Last.fm"
arch=('i686' 'x86_64')
url="http://www.xiami.com/software/xiamiair"
depends=('adobe-air')
license=('unknown')
source=(http://st.xiami.com/download/air/xiamiRadio_v${pkgver}.air xiamiradio ${pkgname}.desktop)
md5sums=("1b7d66033fe189dcf23a0ce6aba4eaa0" "0deedd5a9ecbd6e5d3e533fa88178e5a" "6567183a98cd13af28842c6d87e39654")
makedepends=('unzip')
build() {
    install -d ${pkgdir}/{usr/{bin,share/{applications/${pkgname},icons/${pkgname}}},opt/${pkgname}}
    
    unzip ${srcdir}/xiamiRadio_v${pkgver}.air -d ${srcdir}/   
    
    install -Dm644 ${srcdir}/assets/icon/icon_256.png ${pkgdir}/usr/share/icons/${pkgname}/
    install -Dm644 ${srcdir}/xiamiRadio_v${pkgver}.air ${pkgdir}/opt/${pkgname}/
    
    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}/
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
