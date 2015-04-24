# Maintainer: kugland <kugland at gmail dot com>

pkgname=renamepl
pkgver=1.1
pkgrel=1
pkgdesc="Rename files using perl expressions"
arch=('i686' 'x86_64')
url="https://github.com/kugland/rename.pl"
license=('mit')
depends=('gcc-libs')
source=('https://github.com/kugland/rename.pl/archive/1.1.tar.gz')
md5sums=('7e48ad1de97438027f1bfe4c337f0fa3')

build() {
    true
}

package() {
  install -Dm755 rename.pl-1.1/rename.pl ${pkgdir}/usr/bin/rename.pl
  install -Dm644 rename.pl-1.1/rename.pl.1 ${pkgdir}/usr/share/man/man1/rename.pl.1
}
