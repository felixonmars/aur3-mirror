# Maintainer: Eivind Uggedal <eivind@uggedal.com>

pkgname=going
pkgver=0.9.2
pkgrel=1
pkgdesc='Simple process supervisor.'
arch=('i686' 'x86_64')
url='http://uggedal.github.com/going'
license=('custom: ISC')
depends=('glibc')
conflicts=('systemd')
source=("https://github.com/downloads/uggedal/going/$pkgname-$pkgver.tar.gz")
md5sums=('765e69c82f7820e8ac4e5beb73b9b94b')

build() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d $pkgdir/etc/going.d
}
