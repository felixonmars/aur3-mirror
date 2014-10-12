# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=eqtlbma
pkgver=1.2.2
pkgrel=1
pkgdesc="A bayesian statistical method to detect eQTLs jointly in multiple subgroups (e.g. tissues)"
arch=('i386' 'i686' 'x86_64')
url="https://github.com/timflutre/eqtlbma"
license=('GPL')
depends=('gcc-libs-multilib' 'gsl')
optdepends=('r: Running tutorials')
install='eqtlbma.install'
source=("https://github.com/timflutre/eqtlbma/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/timflutre/eqtlbma/master/scripts/tutorial_eqtlbma.R"
        "https://raw.githubusercontent.com/timflutre/eqtlbma/master/scripts/utils_eqtlbma.R")
noextract=()
md5sums=('ade6803a05c22761444de25a949f61e0'
         'da9cbcf2970d0cdc949fa06f8f68bf68'
         'bda4550ab110396807848692dd0519bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --install --force --symlink
  ./configure --prefix=/usr
  make
  make pdf
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"              
  make DESTDIR="$pkgdir/" install install-info
  mkdir "$pkgdir/usr/share/eqtlbma/"
  cp "$srcdir/$pkgname-$pkgver/doc/manual_eqtlbma.pdf" "$pkgdir/usr/share/eqtlbma/"
  cp "$srcdir/utils_eqtlbma.R" "$pkgdir/usr/share/eqtlbma/"
  cp "$srcdir/tutorial_eqtlbma.R" "$pkgdir/usr/share/eqtlbma/"
}
# vim:set ts=2 sw=2 et:
