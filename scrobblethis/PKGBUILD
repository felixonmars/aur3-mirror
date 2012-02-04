# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=scrobblethis
pkgver=0.4.12
pkgrel=1
pkgdesc="Submit DAP .scrobbler.log files to social music websites like last.fm"
arch=(any)
url="http://scrobblethis.googlecode.com"
license=('GPL3')
depends=('python' 'python-pylast>=0.5.6')
makedepends=('python')
install=
source=(http://scrobblethis.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('2831c44d0dd406f9f656224f28d2cef5')

build() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1 || return 1
}
