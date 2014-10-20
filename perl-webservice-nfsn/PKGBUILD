# Maintainer: Anntoin Wilkinson <anntoin@gmail.com>
pkgname=perl-webservice-nfsn
pkgver=1.03
pkgrel=1
pkgdesc="Client for the NearlyFreeSpeech.Net API"
arch=('any')
url="https://github.com/madsen/webservice-nfsn"
license=('GPL' 'PerlArtistic')
depends=('perl>=5' 'perl-digest-sha1' 'perl-libwww>=6' 'perl-json-xs' 'perl-uri' 'perl-exception-class' 'perl-file-sharedir' 'perl-try-tiny')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CJ/CJM/WebService-NFSN-$pkgver.tar.gz)
md5sums=('ebb32adbf4af1f240a7d5d1c69c6251c')

build() {
  cd "$srcdir/WebService-NFSN-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/WebService-NFSN-$pkgver"

  perl Build install
}

# vim:set ts=2 sw=2 et:
