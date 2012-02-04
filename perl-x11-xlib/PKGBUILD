# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-x11-xlib
pkgver=0.02
pkgrel=1
pkgdesc="Low-level access to the X11 library"
depends=('perl>=5.10.0' 'glibc' 'libx11')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/X11-Xlib/"
source=(http://search.cpan.org/CPAN/authors/id/N/NA/NANARDON/X11-Xlib-$pkgver.tar.gz)
md5sums=('3b109157a58fd2cb34cf74264b8104db')
options=('force' '!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/X11-Xlib-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

