# Maintainer: Ner0

pkgname=cinnamon-extension-coverflow-alt-tab
pkgver=2.1
pkgrel=1
pkgdesc="CoverflowAltTab let's you Alt-Tab through your windows in a cover-flow manner."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/extensions/view/3"
license=('GPL3')
depends=('cinnamon' 'dconf')
install=$pkgname.install
source=("http://cinnamon-spices.linuxmint.com/uploads/extensions/ZC92-F8I5-Q0UJ.zip")
md5sums=('1948b3142949eb33e8b9b9133f7d8941')

package() {
  find CoverflowAltTab\@dmo60.de/ -not -name '*gschema*' -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/extensions/{}" \;

  install -Dm644 CoverflowAltTab\@dmo60.de/schemas/*.xml \
  "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.coverflowalttab.gschema.xml"
}
