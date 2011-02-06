# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=gframecatcher
pkgver=1.4
pkgrel=3
pkgdesc="Saves thumbnailed frames of video files to single or multiple image(s)"
arch=('any')
url="http://developer.berlios.de/projects/$pkgname"
license=('GPL3')
depends=('gstreamer0.10-python>=0.10.13' 'pygtk>=2.13' 'gnome-mime-data')
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e7edb82a1414175673d4540cad5cbe0a')

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
