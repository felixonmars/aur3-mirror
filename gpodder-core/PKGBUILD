# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=gpodder-core
pkgver=4.2.0
pkgrel=1
pkgdesc="Podcast client and feed aggregator"
arch=('any')
url='http://gpodder.org/'
license=('GPL3' 'ISC')
groups=('gpodder')
depends=('python>=3.2' 'python-podcastparser')
conflicts=('gpodder2' 'gpodder3' 'gpodder-git')
source=("http://gpodder.org/src/$pkgname-$pkgver.tar.gz")
sha512sums=('e240e8c1ae16ed1508d0b98e1accb9f929b7a8af983ac522412ceeeb18ed4e49728bb71bf6cbf39bf76ed9a6217414239490f63c7f623f8543cfd9b11dea23c1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.ISC "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ISC"
}
