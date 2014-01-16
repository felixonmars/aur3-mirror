# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-activity-contact
_realname=Browse
pkgver=1
pkgrel=1
pkgdesc="Sugar social networking"
arch=('any')
url="https://github.com/ers-devs/contact-app"
license=('GPL')
depends=('sugar' 'ers-node')
source=(https://github.com/ers-devs/contact-app/archive/${pkgver}.tar.gz)
md5sums=('f79c2a22df3a5e72dfd993b1c7a32332')

package() {
  cd "$srcdir/contact-app-$pkgver"
  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}


