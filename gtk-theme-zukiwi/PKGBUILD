# Maintainer: Drake Arconis <lightdrake at gmail.com>
# Contributor: Frikilinux <frikilinux at gmail.com>
# Contributor: bwat47 <bwat47 at gmail dot com>

pkgname=gtk-theme-zukiwi
pkgver=20131107
pkgrel=1
pkgdesc="A gtk2, gtk3, metacity, and unity theme..."
arch=('any')
url="http://gnome-look.org/content/show.php/Zukiwi?content=152192"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
conflicts=('zukiwi-theme')
options=('!strip')
source=("http://gnome-look.org/CONTENT/content-files/152192-Zukiwi.zip")
sha256sums=('eaa463ed48ad1f0a78f73a88c21a6a7201387d6ff71a7c877150c6d3ea4ab680')


package() {
  # install theme
  find Zukiwi/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

