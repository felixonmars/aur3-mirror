# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Jinx <Jinxware[at]gmail[dot]com>

pkgname=crunch
pkgver=3.6
pkgrel=1
pkgdesc="A wordlist generator for all combinations/permutations of a given character set"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/crunch-wordlist/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/crunch-wordlist/$pkgname-$pkgver.tgz"
        "http://downloads.sourceforge.net/crunch-wordlist/readme.txt")
md5sums=('1cbab783805d1bd382bd2edf33298108'
         'c6947404a6f5a57ffdbcba92203e68ef')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  # bin
  install -Dm755  $pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # data
  install -Dm644 charset.lst \
    "$pkgdir/usr/share/$pkgname/charset.lst"

  # docs
  install -Dm644 ../readme.txt \
    "$pkgdir/usr/share/doc/$pkgname/readme.txt"

  # man
  install -Dm644  $pkgname.1 \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
}
