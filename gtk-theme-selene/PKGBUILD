# Maintainer: Ner0

pkgname=gtk-theme-selene
_realname=selene-theme
_shellname=${pkgname/gtk/gnome-shell}
pkgver=20121021
_pkgver=3.5.0-0ubuntu1~tista1
_shellver=3.4.1-0ubuntu1~tista1
pkgrel=1
pkgdesc="GTK2/GTK3, and GNOME Shell theme based on elementary"
arch=('any')
url=('https://launchpad.net/~tista/+archive/selene')
license=('GPL2')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
source=(${url}/+files/${_realname}_${_pkgver}.tar.gz
	${url}/+files/${_shellname}_${_shellver}.tar.gz)
md5sums=('7fcb3aeaf88bb45a86d009d902093a1c'
         '2863a94d2e1f15fbc5cc5d22a53fba5b')

package () {
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -Pr "${srcdir}"/${_realname}-* "${pkgdir}/usr/share/themes/Selene"

  find . -type d -name 'gnome-shell' -exec cp -r '{}' "${pkgdir}/usr/share/themes/Selene" \;
  rm -rf "${pkgdir}/usr/share/themes/Selene/debian"
}
