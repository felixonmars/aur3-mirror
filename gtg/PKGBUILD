# Maintainer: Pablo Olmos de Aguilera Corradini AKA:PaBLoX <pablo at glatelier [dot} org>
# Contributor: Алексей Гультяев <hokum83 at gmail {dot] com>

pkgname=gtg
pkgver=0.2.9
pkgrel=3
pkgdesc="Getting Things GNOME! is a personal organizer for the GNOME desktop environment. Allows GTD workflow among others."
url="http://gtg.fritalk.com/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'pygtk' 'python2-gobject2' 'python2-configobj' 'python2-xdg'
'python2-dbus' 'xorg-xset' 'hicolor-icon-theme' 'python2-liblarch'
'python2-liblarch_gtk')
optdepends=('python-simplejson: gives full support to RTM plugin')
conflicts=('gtg-bzr')
source=(http://launchpad.net/gtg/0.3/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('83fde67c6f24746438d2d207c247d38a')
install=gtg.install

build() {
  cd ${srcdir}/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir}
}
