# Contributor: gareth_c
# Maintainer: Ner0

pkgname=cinnamon-applet-places
pkgver=1.2
pkgrel=1
pkgdesc="An applet that lets you access your places and bookmarks through an icon in the cinnamon panel."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/5"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/62G3-RSBX-58HS.zip")
md5sums=('1cf65663f9f8f8b0e3abfb585dd3419d')

package() {
  find places-bookmarks\@dmo60.de/ -type f -not -name README -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
