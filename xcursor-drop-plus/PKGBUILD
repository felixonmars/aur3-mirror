# Contributor: rabyte <rabyte*gmail>
# Contributor: fsckd <fsckdaemon -at- gmail.com>

pkgname=xcursor-drop-plus
pkgver=1.1
pkgrel=2
pkgdesc="A beautiful, animated water drop mouse cursor theme for Xorg"
arch=('any')
url="http://gnome-look.org/content/show.php/Drop+Plus?content=72553"
license=('GPL')
depends=('xorg-server')
source=('http://ompldr.org/vODB3Mw/DropPlus11.tar.gz')
# http://ompldr.org/donate.html
#md5sums=('87f798dab562e256e18a4fd4b6d8533d')
sha256sums=('e53db9e55792e4710687bed51b0931f8c023238181b3b4714cbf7ff281806f02')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -rf "$srcdir/DropPlus11/" "$pkgdir/usr/share/icons/drop-plus/"
}

# vim:set ts=2 sw=2 et:
