# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=splashy-theme-archpaint2
pkgver=1.0
pkgrel=1
pkgdesc="Splashy archpaint2 theme"
arch=('any')
url="http://www.archlinux.org"
license=('CCPL')
depends=('splashy' 'wallpaper-archpaint2')
source=("http://www.herecura.be/archlinux/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c1a9c34b38c70525d0243b366de7284ae853d1026097fe8b2176b27386896239')

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/splashy/themes/
  cp -r * ${pkgdir}/usr/share/splashy/themes/
}
