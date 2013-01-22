# Maintainer: Maciej Ciemborowicz <pub[at]ciemborowicz[dot]pl>
pkgname=terminalhero-git
pkgver=20130121
pkgrel=8
pkgdesc="Linux society's response to Microsoft's Guitar Hero. :)"
url="http://ciemborowicz.pl/terminalhero"
arch=('any')
license=('X11')
depends=('perl' 'libtermkey' 'perl-term-termkey' 'perl-poe' 'perl-term-readkey' 'perl-poe-wheel-termkey')
install='terminalhero.install'

_gitroot="https://github.com/ciembor/TerminalHero.git"
_gitname="TerminalHero"

build() {

  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd "${_gitname}"
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
    cd "${_gitname}"
  fi
  msg "GIT checkout done."

  cd "$srcdir/$_gitname"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  { /usr/bin/perl Makefile.PL &&
    make &&
    make install; } || return 1

    msg "=== READ THIS ===================================="
    msg "TerminalHero will be installed in:"
    msg "/usr/bin/vendor_perl/terminalhero"
    msg "You might have to relogin to update PATH variable."
    msg "=================================================="
}
