pkgname=drakfire-caffe-gtk-theme
pkgver=1
pkgrel=4
pkgdesc='Drakfire Caffe GTK3 Theme'
arch=('any')
license=('')
url='http://drakfire86.deviantart.com/art/Drakfire-Caffe-GTK3-206312449?q=gallery%3Adrakfire86&qo=1'
depends=('gtk3')
source=('http://fc03.deviantart.net/fs71/f/2011/115/d/e/drakfire_caffe_by_drakfire86-d3etzpd.zip')
sha256sums=('4d81de6baf4c0d604efb949a33f8f3eb22e4aa458a72627759cdf1eeae0c14dd')

package() {
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -r "${srcdir}/Drakfire-Caffe" "${pkgdir}/usr/share/themes/"
}
