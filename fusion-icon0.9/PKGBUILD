# Maintainer: kozec <kozec at kozec dot com>
# Base on fusion-icon package by Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=fusion-icon0.9
pkgver=0.2
pkgrel=1
pkgdesc="Simple tray icon for compiz 0.9 and GTK3"
arch=('any')
url="https://github.com/kozec/fusion-icon-gtk3"
license=('GPL')
provides=('fusion-icon=0.2')
conflicts=('fusion-icon')
depends=('python2' 'compiz>0.9' 'python2-gobject' 'gtk3' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')
install=fusion-icon.install
source=("https://github.com/kozec/fusion-icon-gtk3/archive/v${pkgver}.tar.gz")

package() {
  cd $srcdir/fusion-icon-gtk3-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}

md5sums=('e046e4073267a38d358d2aad2226da01')
