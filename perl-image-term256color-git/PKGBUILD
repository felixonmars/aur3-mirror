# Maintainer: Adria <matahari@archlinux.us>
pkgname=perl-image-term256color-git
pkgver=20120123
pkgrel=1
pkgdesc='Image::Term256Color - Display images in your 256 color terminal' 
arch=('any')
url='https://github.com/moshen/Image-Term256Color'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-gd' 'perl-term-extendedcolor')
makedepends=('git')
options=(!emptydirs)

_gitroot='https://github.com/moshen/Image-Term256Color.git'
_gitname='Image-Term256Color'

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

  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" || return 1
  cd "$srcdir/$_gitname-build" || return 1  
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Build.PL
  { /usr/bin/perl Build.PL &&
    ./Build; } || return 1
}

check(){
  cd "$srcdir/$_gitname-build" || return 1  
  ./Build test || return 1
}

package(){
  cd "$srcdir/$_gitname-build" || return 1  
  ./Build install || return 1  
 
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
