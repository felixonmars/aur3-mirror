pkgname=grepmail
pkgver=5.3033
pkgrel=1
pkgdesc="Search for emails in a normal or compressed mailbox using a regular expression or date constraint"
arch=(i686 x86_64)
url="http://grepmail.sourceforge.net/"
license=('GPL')
depends=('perl-date-manip' 'perl-timedate' 'perl-mail-mbox-messageparser' 'perl-digest-md5')
makedepends=()
optdepends=()
backup=()
options=()
source=(http://downloads.sourceforge.net/sourceforge/grepmail/grepmail-$pkgver.tar.gz)
md5sums=('83f94e253ccb02fde9a207d7f23c9cd2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
