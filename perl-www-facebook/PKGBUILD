# Maintainer: Zuhair Kamar <held_zaikos@hotmail.com>

pkgname='perl-www-facebook'
pkgver='0.4.18'
pkgrel='1'
pkgdesc="Facebook API implementation"
arch=('any')
url="http://search.cpan.org/~unobe/WWW-Facebook-API-0.4.18/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-crypt-ssleay' 'perl-json-any')
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/U/UN/UNOBE/WWW-Facebook-API-0.4.18.tar.gz')
md5sums=('35b2451a131859ddd9b87c61c36c403b')

build() {

  DIST_DIR="${srcdir}/WWW-Facebook-API-0.4.18"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&make test &&
    make DESTDIR="$pkgdir" install;  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}


