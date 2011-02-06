# Contributor: Matthew Bruenig <matthewbruenig@gmail.com>
pkgname=extemp
pkgver=0.7.1
pkgrel=1
pkgdesc="Download newspaper articles into a searchable db"
arch=('i686')
license=('GPL3')
depends=('python' 'python-feedparser' 'sqlite3')
url="http://extemp.berlios.de"
source=("http://download.berlios.de/extemp/$pkgname-$pkgver.tar.gz")
md5sums=("31b113ae6c3654fd8c6671360c32bae1")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
