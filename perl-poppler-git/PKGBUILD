# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-poppler-git
pkgver=20110127
pkgrel=1
pkgdesc="perl binding of poppler library"
depends=('perl>=5.10.0' 'glibc' 'poppler' 'cairo-perl')
makedepends=('perl-extutils-pkgconfig' 'git' 'patch')
provides=('perl-poppler')
conflicts=('perl-poppler')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Poppler/"
source=()
md5sums=()
options=('force' '!emptydirs')
arch=(i686 x86_64)

_gitroot=https://github.com/c9s/perl-poppler.git
_gitname=perl-poppler

build()
{
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}
