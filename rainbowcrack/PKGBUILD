# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=rainbowcrack
pkgver=1.2
pkgrel=5
pkgdesc="Password cracker based on the faster time-memory trade-off. With MySQL and Cisco PIX Algorithm patches"
arch=('i686' 'x86_64')
url="http://project-rainbowcrack.com/"
license=('custom')
depends=('openssl')
source=("$pkgname-$pkgver-src.tar.xz"
        "$pkgname-mysql_pix-openssl-build.patch"
        "$pkgname-patches.txt")
md5sums=('60137c06b727d6d3ca50340ff2c68292'
         '0c6c6a24018c62b2490b2a2114b87888'
         '94e016807c834980d98ef71690ec6ad4')

prepare() {
  cd $pkgname-$pkgver-src
  patch -p1 -i ../${source[1]}
}

build() {
  cd $pkgname-$pkgver-src/src
  make -f makefile.linux
}

package() {
  cd $pkgname-$pkgver-src/src

  # bin
  install -d "$pkgdir/usr/bin"
  install -Dm755 r{t,c}* "$pkgdir/usr/bin"

  # data
  install -Dm644 "$srcdir/${source[2]}" \
    "$pkgdir/usr/share/$pkgname/patches.txt"
  install -Dm644 charset.txt ../readme.txt \
    "$pkgdir/usr/share/$pkgname"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../doc/* \
    "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -Dm644 ../disclaimer.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
