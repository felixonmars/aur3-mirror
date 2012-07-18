# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname="tm-tools"
_pkgname="TMtools"
pkgver="20120707"
pkgrel=1
pkgdesc="A set of tools for quick structural alignment of proteins"
arch=('i686' 'x86_64')
url="http://zhanglab.ccmb.med.umich.edu/TM-align"
license=('custom')
makedepends=('gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::http://zhanglab.ccmb.med.umich.edu/TM-align/${_pkgname}${pkgver}.tar.gz"
        "LICENSE")
noextract=("$pkgname-$pkgver.tar.gz")
md5sums=('2d56cf82a0994c8bedc3af97ce90e5c8'
         '57d359587a228ee843f6b9c88eb30588')

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/$pkgname-$pkgver"
  tar -C "$srcdir/$pkgname-$pkgver" -xf "$pkgname-$pkgver.tar.gz"
  cd "$srcdir/$pkgname-$pkgver"
  gfortran -static -O3 -ffast-math -lm -o TMalign TMalign.f
  gfortran -static -O3 -ffast-math -lm -o TMscore TMscore.f
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D TMalign "$pkgdir/usr/bin/TMalign"
  install -D TMscore "$pkgdir/usr/bin/TMscore"
  install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
