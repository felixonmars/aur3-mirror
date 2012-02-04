# Maintainer: Pablo Olmos de Aguilera Corradini AKA:PaBLoX <pablo at glatelier [dot} org>
# Contributor: Алексей Гультяев <hokum83 at gmail {dot] com>

pkgname=gtg
pkgver=0.2.5
pkgrel=1
pkgdesc="Getting Things GNOME! is a personal organizer for the GNOME desktop environment. Allows GTD workflow among others."
url="http://gtg.fritalk.com/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'pygtk' 'python2-gobject2' 'python-configobj' 'pyxdg' 'dbus-python' 'xorg-xset' 'hicolor-icon-theme')
optdepends=('python-simplejson: gives full support to RTM plugin')
conflicts=('gtg-bzr')
source=(http://launchpad.net/gtg/0.2/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('d1bdb2ccb0f362d051594d0373be470b')
install=gtg.install

build() {
  cd ${srcdir}/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir}
}
