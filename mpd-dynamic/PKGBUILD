# Maintainer: bal <b.vajdics[at]gmail[dot]com>
# Contributor: xduugu
_author=jquelin
_perlmod=Audio-MPD
pkgname=mpd-dynamic
pkgver=1.120610
pkgrel=1
pkgdesc="A dynamic playlist for mpd"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/bin/$pkgname"
license=('GPL' 'PerlArtistic')
groups=()
depends=("perl-audio-mpd=$pkgver" 'perl-getopt-euclid' 'perl-proc-daemon')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=(http://cpan.perl.org/modules/by-authors/id/J/JQ/JQUELIN/$_perlmod-$pkgver.tar.gz) 
md5sums=('99795ff96b545b389df1b296186803d7')
sha256sums=('2b66fc1e8f59d3fbeaf055097457a9f97571788397a154850de3e2066ff855cf')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install

  # remove all files not necessary for mpd-dynamic
  find "$pkgdir" -type f ! -name "*mpd-dynamic*" -delete
}

# vim:set ts=2 sw=2 et:
