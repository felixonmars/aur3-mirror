# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=etswitch
pkgver=0.1.14
pkgrel=5
pkgdesc="A *nix 'minimizer' for a few games"
url="http://hem.bredband.net/b400150/"
arch=('i686' 'x86_64')
license=("GPL")
depends=("libxmu" "libxpm" "libxxf86vm")
source=(http://hem.bredband.net/b400150/etswitch/$pkgname-$pkgver.tar.gz)
md5sums=('4f924bff0bb4fcded8cb73ff338b8563')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}



