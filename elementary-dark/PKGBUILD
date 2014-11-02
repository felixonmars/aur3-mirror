# Maintainer: Michael Smith (~spinda) <michael@diglumi.com>
pkgname=elementary-dark
pkgver=1.0
pkgrel=1
pkgdesc='elementary Dark is a soft and subtle dark theme based on the higly popular elementary theme (GTK2, GTK3, Metacity, Unity)'
arch=(any)
depends=('gtk-engine-murrine' 'gtk-engine-unico')
url='https://satya164.deviantart.com/art/elementary-Dark-GTK3-Theme-244257862'
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://fc00.deviantart.net/fs70/f/2012/164/2/0/elementary_dark___gtk3_theme_by_satya164-d41fakm.zip")
sha256sums=('008e06b7966643e81a819e911147bb77b91a1d56ef4b5107c225c2044f1606fb')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r "${srcdir}/elementary Dark" ${pkgdir}/usr/share/themes/elementary-dark
}

