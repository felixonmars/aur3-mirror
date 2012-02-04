# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-net-bittorrent-file'
pkgver='1.02'
pkgrel='1'
pkgdesc="Object for manipulating .torrent files"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-convert-bencode>=1.03' 'perl-digest-sha1>=2')
url='http://search.cpan.org/dist/Net-BitTorrent-File'
source=('http://search.cpan.org/CPAN/authors/id/O/OR/ORCLEV/Net-BitTorrent-File-1.02-fix.tar.gz')
md5sums=('8379335dc0a09e22904f914ca5448842')

build() {
  _DISTDIR="${srcdir}/Net-BitTorrent-File-1.02"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -delete
  find "$pkgdir" -name perllocal.pod -delete
}
