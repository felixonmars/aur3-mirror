# Maintainer: Roy Zhang <pudh4418 at gmail [dot} com>
# Contributor: Алексей Гультяев <hokum83 at gmail {dot] com>

pkgname=gtg
pkgver=0.3.1
pkgrel=1
pkgdesc="Getting Things GNOME! is a personal organizer for the GNOME desktop environment. Allows GTD workflow among others."
url="http://gtgnome.net/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'pygtk' 'python2-gobject2' 'python2-configobj' 'python2-xdg'
'python2-dbus' 'python2-notify' 'xorg-xset'
'hicolor-icon-theme' 'desktop-file-utils' 'python2-liblarch')
optdepends=('python2-simplejson: gives full support to RTM plugin')
conflicts=('gtg-bzr')
source=(http://launchpad.net/gtg/0.3/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('d51a4e5eb0cfb29b3556c4e82c0b2dd8')
install=gtg.install

package() {
  cd ${srcdir}/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1
}
