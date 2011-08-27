# Contributor: lp76 <l.peduto@gmail.com>
pkgname=gmailreader
pkgver=0.7
pkgrel=3
pkgdesc="An email client that lets you use Gmail on a terminal without a Web browser"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gmailreader/"
license=('GPL')
depends=('libgmail-modified' 'html2text')
source=(http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('fb8b6c370f9912f54b806aa6922095a5')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=$pkgdir/usr  --install-data=$pkgdir/usr/share
}
