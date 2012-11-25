# Maintainer: Ner0

pkgname=stormcloud
pkgver=1.1
pkgrel=1
pkgdesc="A simple weather app written in python"
arch=('any')
url="https://www.launchpad.net/stormcloud"
license=('custom:DBAD' 'custom:Simplified BSD')
depends=('dconf' 'python2' 'python2-gobject' 'webkitgtk3')
makedepends=('python2-distutils-extra')
conflicts=('stormcloud-git')
install=stormcloud.install
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz")
md5sums=('8f0e6f74b49025e590ddc80d6345410f')

package() {
  cd $pkgname

  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Licenses
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  curl -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE.simplified-bsd" \
          https://raw.github.com/PrimaryFeather/Starling-Framework/master/LICENSE.md \
       -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE.dbad" \
          https://raw.github.com/stfsux/rld/master/LICENSE.md -s
}

# vim:set ts=2 sw=2 et:
