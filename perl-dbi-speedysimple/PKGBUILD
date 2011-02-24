# Maintainer: kevku <kevku@msn.com>
pkgname=perl-dbi-speedysimple
pkgver=0.01
pkgrel=1
pkgdesc="A simple interface to Perl's DBI with memory caching and utf8 support."
arch=('any')
url="https://github.com/Kulag/DBI-SpeedySimple"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-dbi')
makedepends=('git')
options=(!emptydirs)

_gitroot="https://github.com/Kulag/DBI-SpeedySimple.git"
_gitname="DBI-SpeedySimple"

build() {
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

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make install DESTDIR="$pkgdir/"
} 
