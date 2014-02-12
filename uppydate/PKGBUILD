# Maintainer: Bob Pirkle <bobhenrypirkle@gmail.com>
pkgname=uppydate
pkgver=3.0
pkgrel=1
pkgdesc="simple update notifier with AUR support and gui interface; superseded by argon"
url="http://code.google.com/p/uppydate/"
license=('GPL')
arch=('any')
depends=(bash cower libnotify python python-gobject)
source=(http://uppydate.googlecode.com/git/uppydate-3.0.tar.gz)

package() {
cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR="$pkgdir/" install
}

md5sums=('0c12420a659dc6cb6ad943f851e0f3c7')
