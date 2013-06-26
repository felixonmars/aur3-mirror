# Maintainer: Paul Barker <paul@paulbarker.me.uk>
pkgname=openbox-zenburn-theme
pkgver=1
pkgrel=1
pkgdesc="Zenburn theme for Openbox 3, from box-look.org"
arch=('any')
license="unknown"
url="http://box-look.org/content/show.php?content=103045"
source=('http://gnome-look.org/CONTENT/content-files/100628-Zenburn.tar.bz2')
md5sums=('23546ebc09dfbaffb74399770ab59184')
sha256sums=('19405aa707b535d2e83d8cb3d9d401e2e7e67f414061ec0c46db2776a76575dd')

package() {
  cd "${srcdir}"
  install -m0755 -d "${pkgdir}/usr/share/themes/Zenburn/openbox-3"
  install -m0755 -d "${pkgdir}/usr/share/themes/Zenburn/gtk-2.0"
  install -m0644 Zenburn/openbox-3/*.xbm Zenburn/openbox-3/themerc "${pkgdir}/usr/share/themes/Zenburn/openbox-3"
  install -m0644 Zenburn/gtk-2.0/gtkrc "${pkgdir}/usr/share/themes/Zenburn/gtk-2.0"
}
