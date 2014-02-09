# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Brandon Niemczyk <maccorin@cfl.rr.com>

pkgname=frozen-bubble-git
pkgver=2.2.1.r57.g905bf71
pkgrel=1
pkgdesc="A game in which you throw colorful bubbles and build groups to destroy the bubbles (development version)"
arch=(i686 x86_64)
url="http://www.frozen-bubble.org"
license=(GPL2)
depends=(perl-sdl perl-ipc-system-simple perl-compress-bzip2 perl-file-which)
makedepends=(perl-file-slurp perl-locale-maketext-lexicon)
options=('!emptydirs')
provides=('frozen-bubble')
conflicts=('frozen-bubble')
source=(frozen-bubble::"git+https://github.com/kthakore/frozen-bubble.git"
        "frozen-bubble.desktop")
md5sums=('SKIP'
         '01b10b77ba6ad856f5c199121c582272')

pkgver() {
  cd frozen-bubble

  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd frozen-bubble

  unset CFLAGS

  # install module in vendor directories
  perl Build.PL installdirs=vendor
  perl Build
}

check() {
  cd frozen-bubble

  perl Build test
}

package() {
  cd frozen-bubble

  perl Build install destdir="$pkgdir"

  # desktop entry
  install -Dm644 share/icons/frozen-bubble-icon-64x64.png "$pkgdir"/usr/share/pixmaps/frozen-bubble.png
  install -Dm644 ../frozen-bubble.desktop "$pkgdir"/usr/share/applications/frozen-bubble.desktop
}
