# author:  Stunts <f.pinamartins@gmail.com>

pkgname=drakfire-caffe-gtk3
up_pkgname=Drakfire-Caffe
pkgver=1
pkgrel=1
pkgdesc="Gtk3 theme based on Adwaita"
arch=(any)
license=('unknown')
depends=('gtk3' 'unzip')
url="http://drakfire86.deviantart.com/art/Drakfire-Caffe-GTK3-206312449"
source=(http://www.deviantart.com/download/206312449/drakfire_caffe_by_drakfire86-d3etzpd.zip)
md5sums=('045b17216b44a73f1ca7528407271500')

build() {
  unzip drakfire_caffe_by_drakfire86-d3etzpd.zip
  cd "${srcdir}/"
  
}

package() {
  install -d ${pkgdir}/usr/share/themes
  cp -r ${up_pkgname} ${pkgdir}/usr/share/themes
}


