# Contributor: Calimero <calimeroteknik@free.fr>
# Contributor: Carlos Solís <csolisr at gmail dot com>
# Contributor: Hakim Zulkufli <acrox999[at]gmail[dot]com>

pkgname=moka-gtk-theme
pkgver=1.0
pkgrel=9
pkgdesc='Moka GTK theme is modern dual-colour theme for GTK3-based Linux desktop environment. It encorporates a quasi-flat style, using simple geometry & basic colouring.'
arch=('any')
license=('GPL')
url=('http://mokaproject.com/moka-gtk-theme/')
source=('http://sourceforge.net/projects/mokaproject/files/moka-gtk-theme.zip/download')
sha256sums=('10cffa6d7c770d9cdf8ccc35117729f811373638ee5ffbf30b345eb7b346d2f3')

package() {
  install -m755 -d "${pkgdir}/usr/share/themes/"
  cp -rv "${srcdir}/Moka" "${pkgdir}/usr/share/themes/"
  cp -rv "${srcdir}/Moka-Dark" "${pkgdir}/usr/share/themes/"
  chmod -R 755 "${pkgdir}/usr/share/themes/Moka/"
  chmod -R 755 "${pkgdir}/usr/share/themes/Moka-Dark/"
}
