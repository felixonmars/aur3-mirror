# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python2-microfiber
_pkgname=microfiber
pkgver=11.09.1
pkgrel=1
pkgdesc="A fabric for a lightweight Couch."
arch=('any')
url="http://www.kickstarter.com/projects/novacut/novacut-pro-video-editor"
license=('LGPL3')
depends=('python2')
makedepends=('python-sphinx')
source=("https://launchpad.net/$_pkgname/trunk/11.09/+download/$_pkgname-$pkgver.tar.gz")
md5sums=('b7eac993330e2efd22ec2781de4ffd60')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
}
