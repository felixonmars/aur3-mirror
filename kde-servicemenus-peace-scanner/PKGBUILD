

pkgname=kde-servicemenus-peace-scanner
name=kde-service-menu-peace-scanner
pkgver=0.5.0
pkgrel=1
pkgdesc="This service menu let you to get documents form your scanner and eventually print it with fitplot option"
arch=('any')
url="https://opendesktop.org/content/show.php/kde+service+menu+peace+scanner?content=139016"
license=('GPL')
depends=('sane')
source=(http://kde-peace-settings.googlecode.com/files/${name}_${pkgver}.tar.gz)
md5sums=('eda839af6b91e8e4aaa61c8b1fd5610d')

build() {
  mkdir -p "${pkgdir}/usr/share/kde4/services/ServiceMenus/"
  mkdir -p "${pkgdir}/usr/local/bin/"
  install -m 644 "${srcdir}/kde-service-menu-scanner/usr/share/kde4/services/ServiceMenus/$name.desktop" "${pkgdir}/usr/share/kde4/services/ServiceMenus/"
  install -m 755 "${srcdir}/kde-service-menu-scanner/usr/bin/$name" "${pkgdir}/usr/local/bin/"
}
