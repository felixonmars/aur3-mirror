# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk

pkgname=cocos2d
pkgver=0.6.0
pkgrel=1
pkgdesc="A framework for building graphical/interactive applications."
arch=('any')
url="http://cocos2d.org/"
license=('BSD' 'LGPL' 'custom')
depends=('python2-pyglet' 'python2-numpy')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/c/cocos2d/cocos2d-$pkgver.zip")
options=(!emptydirs)
md5sums=('7fb181a387038133fe15662c00d6cf9d')

prepare() {
  # python2 fixes
  sed -i 's/env python/&2/' `grep -rl "env python"`
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a doc/* "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a samples "$pkgdir/usr/share/$pkgname"

  # licenses
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -a LICENSE* "$pkgdir/usr/share/licenses/$pkgname"
}
