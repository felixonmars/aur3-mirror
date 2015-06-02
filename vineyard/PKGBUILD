# Maintainer: Košava <kosava@archlinux.us>

pkgname=vineyard
pkgver=0.1.4.1.4
pkgrel=2
pkgdesc="Libraries and graphical utilities for using and configuring Wine from the Gnome desktop."
arch=('i686' 'x86_64')
url="https://launchpad.net/vineyard"
license=('GPL')
groups=('emulators')
depends=('wine' 'python2-wine' 'hicolor-icon-theme' 'pygtk')
source=('http://launchpad.net/vineyard/1.4/1.4.1/+download/vineyard-0.1.4.1.4.tar.gz'
		'fix_icon_theme.patch')
md5sums=('90fbb6b20232000e1af2f9bb43f2e9a0'
		'303180ea2330fefe723e3ee5b431033f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ${srcdir}/fix_icon_theme.patch
  python2 ./setup.py install --root=$pkgdir/
}