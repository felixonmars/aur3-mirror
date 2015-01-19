# Maintainer: Brandon Invergo < http://www.brandoninvergo.com >
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=grotesque
pkgver=0.9.5.1
pkgrel=1
pkgdesc="A utility that helps you manage your collection of interactive fiction, or text adventures."
arch=(any)
url="http://grotesque.invergo.net/"
license=('GPL')
depends=('python2-gobject' 'gtk3' 'python2-pyifbabel')
groups=()
source=(http://grotesque.invergo.net/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('7cd37b50277d6748d47540b486e91290')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
