# CPAN Name  : MooseX-MultiInitArg
# Submitter  : SIGTERM
# Maintainer : SIGTERM

pkgname='perl-moosex-multiinitarg'
pkgver='0.02'
pkgrel='2'
pkgdesc="Attributes with aliases for constructor arguments."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose')
makedepends=()
url='http://search.cpan.org/dist/MooseX-MultiInitArg'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FRODWITH/MooseX-MultiInitArg-0.02.tar.gz')
md5sums=('5a115595cacfbdea3b9631f330a778d7')
sha512sums=('73260d333e7ddfb0666f0f075d19887d74a310114616fc270ff2382a8a5e010a8294c776e4aa77ef8970f4499cb07f6da74696670fea30c208e2634e346b33bb')


build() {
  cd "$srcdir/MooseX-MultiInitArg-0.02"
  PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor
  perl Build
}

check() {
  cd "$srcdir/MooseX-MultiInitArg-0.02"
  PERL_MM_USE_DEFAULT=1
  perl Build test
}

package() {
  cd "$srcdir/MooseX-MultiInitArg-0.02"
  perl Build install --destdir "$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
