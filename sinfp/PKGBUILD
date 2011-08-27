# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=sinfp
_cpanname=Net-SinFP
pkgver=2.06
pkgrel=2
pkgdesc="A full operating system stack fingerprinting suite."
arch=('any')
url="http://search.cpan.org/~GOMOR/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-net-packet-target' 'perl-dbix-sqlite-simple>=0.33' 'perl-class-gomor' 'perl-net-packet>=3.20')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/G/GO/GOMOR/${_cpanname}-${pkgver}.tar.gz sinfp.pl.diff) 
md5sums=('e0a04f67801b594345a7eee91041803f' '8dd9d72d1ab6ee6c0b78ddc6db1de27a')

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  sed -i '/^auto_install/d' Makefile.PL
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete

  # Move db to /usr/share/sinfp, binary to /usr/bin
  mkdir -p $pkgdir/usr/share/sinfp
  mkdir -p $pkgdir/usr/bin
  mv -v $pkgdir/usr/lib/perl5/vendor_perl/bin/sinfp.db $pkgdir/usr/share/sinfp/sinfp.db
  patch $pkgdir/usr/lib/perl5/vendor_perl/bin/sinfp.pl $startdir/sinfp.pl.diff
  mv -v $pkgdir/usr/lib/perl5/vendor_perl/bin/sinfp.pl $pkgdir/usr/bin/sinfp
  chmod 644 $pkgdir/usr/share/sinfp/sinfp.db
  chmod 755 $pkgdir/usr/bin/sinfp
}
