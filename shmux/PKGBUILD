# Maintainer: ryenus <ryenus@gmail.com>

pkgname=shmux
pkgver=1.0.2
pkgrel=1
pkgdesc="Shell Multiplexor - execute the same command on many hosts in parallel"
arch=('i686' 'x86_64')
url="http://web.taranis.org/shmux/"
license=('GPL') # See LICENSE file
depends=('fping' 'openssh')
makedepends=('perl')
optdepends=('pcre: pcre support')
source=("http://web.taranis.org/shmux/dist/shmux-$pkgver.tgz")
md5sums=('4ab5c46b4154cbeab54bdc0036bd9140')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
  # make test
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh syn=sh
