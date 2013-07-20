# CPAN Name : Mplayer::NowPlaying
# Maintainer: Gabriel Fornaeus <gf@hax0r.se>
# Contributor: willemw <willemw12@gmail.com>

pkgname=perl-mplayer-nowplaying
_pkgname=Mplayer-NowPlaying
pkgver=0.030
pkgrel=2
pkgdesc="Query a running mplayer process for now playing metadata"
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Mplayer-NowPlaying'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/W/WO/WOLDRICH/Mplayer-NowPlaying-$pkgver.tar.gz)
md5sums=('c7b3b79100c90b82f44afcf8e9de99c4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
  make test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

