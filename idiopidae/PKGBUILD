# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=idiopidae
pkgver=0.5.4
pkgrel=1
pkgdesc="A simple literate programming system written in python."
arch=('any')
url="https://github.com/zedshaw/idiopidae"
license=('MIT')
depends=('python2')
source=("http://www.dexy.it/external-dependencies/$pkgname-$pkgver.tar.gz")
md5sums=('cbfd815581f803cabcb5d7e4f56d632d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
}
