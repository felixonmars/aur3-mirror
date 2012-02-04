#
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
#

pkgname=perl-ogg-vorbis
pkgver=0.05
pkgrel=2
pkgdesc="Ogg::Vorbis - Perl extension for Ogg Vorbis streams"
url="http://search.cpan.org/~foof/libvorbis-perl-0.05/debian/tmp/usr/lib/perl/5.6.1/i386-linux/Ogg/Vorbis.pm"
license="GPL"
depends=('perl')
arch=('i686' 'x86_64')
options=('noemptydirs')

source=(http://search.cpan.org/CPAN/authors/id/F/FO/FOOF/libvorbis-perl-$pkgver.tar.gz)
md5sums=('4b1d0f936b029f4390c524db0892a65f')

build() {
  cd $startdir/src/libvorbis-perl-$pkgver
  /usr/bin/perl Makefile.PL
  make
  make DESTDIR=$startdir/pkg install

  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm '{}' \;
}
