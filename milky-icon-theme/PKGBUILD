# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=milky-icon-theme
_pkgname=milky
pkgver=2.0
pkgrel=1
pkgdesc="Icon theme for KDE4 from Pardus Linux."
url="http://www.pardus.org.tr/"
arch=('any')
depends=('kdebase-workspace')
license=('CCPL')
source=("http://cekirdek.pardus.org.tr/~gokcen/files/milky/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('19d5220536f9d9ef8cbcab9716f9188c')

package() {
    install -d "${pkgdir}/usr/share/icons/"
    cp -R "${srcdir}/milky" "${pkgdir}/usr/share/icons/"
}
