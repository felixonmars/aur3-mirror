# Contributor: Peter Morris <pete.morris_AT_gmail.com>
pkgname=perl-audio-cd-deb
pkgver=0.05
pkgrel=2
pkgdesc="Perl interface to libcdaudio (cd + cddb)"
arch=('i686' 'ppc')
url="http://packages.qa.debian.org/a/audio-cd.html"
license=('unknown')
depends=('libcdaudio')
provides=('perl-audio-cd')
conflicts=('perl-audio-cd')
source=(http://ftp.debian.org/pool/main/a/audio-cd/audio-cd_$pkgver.orig.tar.gz)
md5sums=('9f4a58c584819b6a30ecf20dcede452c')
sha1sums=('897b497aa2fa21df83fb351f2cdecc3f5ad1b89a')

build() {
  cd $startdir/src/audio-cd-$pkgver.orig
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
