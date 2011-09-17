# author:  Stunts <f.pinamartins@gmail.com>

pkgname=slave-gtk3
up_pkgname=SLAVE-GTK3
pkgver=1.2
pkgrel=1
pkgdesc="Gtk3 Dark theme"
arch=(any)
license=('GPLv3')
depends=('gtk3' 'unzip')
url="http://thedeviantmars.deviantart.com/art/SLAVE-GTK3-256366787"
source=(http://www.deviantart.com/download/256366787/slave___gtk3_by_half_left-d48mtvn.zip)
md5sums=('8d0e3da40601f27e9c5b9585339e64e2')

build() {
  unzip slave___gtk3_by_half_left-d48mtvn.zip
  cd "${srcdir}/"
  
}

package() {
  install -d ${pkgdir}/usr/share/themes
  cp -r ${up_pkgname} ${pkgdir}/usr/share/themes
}

