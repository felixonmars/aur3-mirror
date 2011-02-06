# Maintainer: Gorodinskiy Konstantin <gor.konstantin@gmail.com>
pkgname=rakudostar
pkgver=2010.12
pkgrel=1
pkgdesc="Perl6 on Parrot VM"
arch=("i686" "x86_64")
url="http://rakudo.org/"
license=(PerlArtistic)
depends=()
makedepends=("perl>=5.8" "parrot>=2.11.0-2")
source=(http://cloud.github.com/downloads/rakudo/star/rakudo-star-$pkgver.tar.gz)
md5sums=("06623c9719c846e15016dfd344616307")

build() {
	cd "$srcdir/rakudo-star-$pkgver"
	perl Configure.pl || return 1
	mkdir -p "$pkgdir"/usr/bin
  make
  cp rakudo/perl6 "$pkgdir"/usr/bin
  export PERL6LIB="$pkgdir$(parrot_config libdir)$(parrot_config versiondir)/languages/perl6/lib"
	make DESTDIR="$pkgdir" install || return 1
}
