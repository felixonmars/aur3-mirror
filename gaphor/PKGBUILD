# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme
# Contributor: encelo

pkgname=gaphor
pkgver=0.17.2
pkgrel=1
pkgdesc="An easy to use modeling environment for UML design"
arch=('any')
url="http://gaphor.sourceforge.net"
license=('GPL')
depends=('gaphas' 'python2-zope-component' 'python2-distribute' 'etk.docking')
makedepends=('python2-nose' 'python2-sphinx')
install="$pkgname.install"
source=("http://pypi.python.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f42e27a082a0890baf626dd70e17ca95')

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  find . -name "*.py" -exec \
    sed -i "s/\(#\!.*python\).*/\12/" {} \;

  # zope-component fix
#  sed -i "/self/s/\.\(registry\)/\.global\1/" \
#    gaphor/services/componentregistry.py
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/"

  # desktop
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 iconsrc/$pkgname.svg \
    "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
