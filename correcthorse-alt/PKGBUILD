# Maintainer: Mattias Andrée <maandree@operamail.com>
pkgname=correcthorse-alt
pkgver=1.1
pkgrel=3
pkgdesc="Passphrase generator based on http://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/maandree/correcthorse"
license=('WTFPL')
optdepends=('bc: for using the correcthorse-security script' 'coreutils: for using the correcthorse-security script')
provides=('correcthorse' 'correcthorse-alt')
conflicts=('correcthorse' 'correcthorse-alt')
source=(https://github.com/maandree/correcthorse/tarball/v1.1)
md5sums=(57189fc5f945822f1110570522d289b2)

build() {
  cd maandree-correcthorse-3ef1073
  make -B PREFIX=/usr
}

package() {
  cd maandree-correcthorse-3ef1073
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
