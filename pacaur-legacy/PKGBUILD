# Maintainer: Remy Marquis <remy.marquis at gmail dot com>

pkgname=pacaur-legacy
pkgver=2.4.3
pkgrel=1
pkgdesc="A fast workflow AUR wrapper using cower as backend for pacman<4"
arch=('any')
url="https://github.com/Spyhawk/pacaur"
license=('GPL')
depends=('cower-legacy' 'expac' 'sudo')
optdepends=('pacman-color: colorized output')
provides=('pacaur')
conflicts=('pacaur')
backup=('etc/pacaur.conf')
source=("https://github.com/downloads/Spyhawk/pacaur/pacaur-$pkgver.tar.gz")
md5sums=('6c06bf700187fa1b3f04a95de848991b')
build() {
  mkdir -p "$pkgdir/etc/"
  install -D -m644 ./pacaur.conf $pkgdir/etc/pacaur.conf || return 1
  install -D -m755 ./pacaur $pkgdir/usr/bin/pacaur || return 1
  install -D -m755 ./pacaur.bash.complete\
        $pkgdir/etc/bash_completion.d/pacaur || return 1
  mkdir -p "$pkgdir/usr/share/man/man8/"
  pod2man --section=8 --center="Pacaur Manual" --name="PACAUR" --release="pacaur-legacy $pkgver" ./README.pod > pacaur.8
  install -m 644 ./pacaur.8 $pkgdir/usr/share/man/man8/pacaur.8 
}
