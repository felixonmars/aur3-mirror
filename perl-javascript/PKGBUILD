# Maintainer: Simon Perry <pezz [swirly thing] sanxion [dot] net>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-javascript
pkgver=1.16
pkgrel=8
pkgdesc="Perl extension for executing embedded JavaScript"
depends=('glibc' 'perl>=5.10.0' 'perl-test-exception' 'spidermonkey-1.7' 'nspr' 'xulrunner')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/JavaScript/"
source=(http://search.cpan.org/CPAN/authors/id/C/CL/CLAESJAC/JavaScript-$pkgver.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
    cd ${srcdir}/JavaScript-$pkgver

    # Hack to pass the correct includes to the script
    export JS_THREADSAFE=1 JS_ENABLE_E4X=1 JS_UTF8=1 JS_FORCE=1 JS_INC="/usr/include/spidermonkey-1.7/ -I/usr/include/nspr/ -I/usr/include/xulrunner-10.0.2/"
    export CCFLAGS="gcc"

    perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
  
    # Remove .packlist and perllocal.pod files.
    find ${pkgdir} -name '.packlist' -delete
    find ${pkgdir} -name 'perllocal.pod' -delete
}

md5sums=('c3c4a744e0a5018b94f53341baa18df7')
