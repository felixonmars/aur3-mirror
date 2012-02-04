# 
# Contributor: Oliver Charles <oliver.g.charles@googlemail.com>
#

pkgname=perl-catalyst-component-acceptcontext
pkgver=0.05
pkgrel=1
pkgdesc="Make the current Catalyst request context available in Models and Views"
arch=('i686', 'x86_64')
url="http://search.cpan.org/~jrockway/Catalyst-Component-ACCEPT_CONTEXT/"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.0' 'perl-catalyst-runtime' 'perl-devel-cycle')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/J/JR/JROCKWAY/Catalyst-Component-ACCEPT_CONTEXT-$pkgver.tar.gz)
md5sums=('95fd36fa91716db99dbb4e488b6ff573')

build() {
    cd $startdir/src/Catalyst-Component-ACCEPT_CONTEXT-$pkgver
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make DESTDIR="$pkgdir/" install || return 1

    find "$pkgdir" -name '.packlist' -delete
    find "$pkgdir" -name 'perllocal.pod' -delete
}
