# Contributor: lp76 <l.peduto@gmail.com>
pkgname=libgmail-modified
pkgver=0.1.8
pkgrel=3
pkgdesc="A modified version of libgmail that supports spam report and message archiving features"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gmailreader/libgmail/index.htm"
license=('GPL')
depends=('python2')
provides=('libgmail')
conflicts=('libgmail')
source=(http://www.nongnu.org/gmailreader/libgmail/libgmail-$pkgver-rafael4.tar.gz)
md5sums=('190580c74d38e7b754a8973bec2f6cff')

build() {
  cd $srcdir/libgmail-$pkgver-rafael4
  python2 setup.py install --root=$pkgdir
}
