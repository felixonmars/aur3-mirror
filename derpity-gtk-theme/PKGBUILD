# Maintainer:  3ED <krzysztof1987 ta gmail tod com>

pkgname=derpity-gtk-theme
_pkgname=Derpity
_contentid=141726
pkgver=20110522
pkgrel=1
pkgdesc="Derpity theme for gtk2 and gtk3"
arch=(any)
license=('GPL')
makedepends=('unzip')
optdepends=('gtk2: if you want gtk2 with derpity theme'
            'gtk3: if you want gtk3 with derpity theme')
install=derpity-gtk-theme.install
url="http://gnome-look.org/content/show.php/${_pkgname}?content=${_contentid}"
source=(http://gnome-look.org/CONTENT/content-files/${_contentid}-${_pkgname}.zip)
sha256sums=('8e27aaeb0242e0a9fbd604104e5506a9f6f40ef43c37ac3b627bf908962eae88')

build() { true; }
package() {
  cd "${srcdir}/"

  find "${_pkgname}/" -type d \
    -exec install -dm755 "${pkgdir}/usr/share/themes/{}" \;

  find "${_pkgname}/" -type f \
    -not -name "*~" -and -not -name "Thumbs.db" \
    -exec install -m644 "{}" "${pkgdir}/usr/share/themes/{}" \;

  install -m644 panelbg.png "${pkgdir}/usr/share/themes/${_pkgname}/"
}
