# Maintainer: Dale Mallion <dale.mallion@gmail.com>

pkgname=gnome-shell-theme-zukitwo-cupertino
pkgver=0.5.1
pkgrel=1
pkgdesc="Zukitwo Cupertino is made off the great Zukitwo theme, aimed to integrate the GNOME-Shell better to a Mac OSX like GTK-theme (i.e. Adwaita Cupertino)."
arch=(any)
url="http://mlaggner.deviantart.com/art/Zukitwo-Cupertino-289102924"
license=('GPL')
source=('http://www.deviantart.com/download/289102924/zukitwo_cupertino_by_mlaggner-d4s4h8s.zip')
depends=('gnome-shell')
md5sums=('5186ba31783cbad43ce516d0380cec05')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options')

build() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -rf Zukitwo-Cupertino "${pkgdir}"/usr/share/themes/
  chmod 755 -R "$pkgdir/usr/share/themes"
}
