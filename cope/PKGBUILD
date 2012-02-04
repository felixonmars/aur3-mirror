# Contributor: Will Chappell <mr.chapendi@gmail.com>
# Maintainer: denton <e9203.00 gmail>
pkgname=cope
pkgver=rc1
pkgrel=4
pkgdesc='A colourful wrapper for terminal programs'
url=http://stuff.cytzol.org/$pkgname
arch=(any)
license=(GPL PerlArtistic)
depends=("perl>=5.1" perl-env-path perl-file-sharedir perl-io-stty
         perl-io-tty perl-list-moreutils perl-params-util perl-regexp-common)
conflicts=($pkgname-git)
source=(http://stuff.cytzol.org/$pkgname/$pkgname-$pkgver.tar.gz
	$pkgname.sh)
install=$pkgname.install
md5sums=(17234f727bc6269c8e80b8589e447e1e
         2769ed01bf41fe73cada4838a4ffef60)

build() {
  cd $pkgname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=$pkgdir

  install -D $srcdir/$pkgname.sh /usr/share/$pkgname/$pkgname.sh

  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
