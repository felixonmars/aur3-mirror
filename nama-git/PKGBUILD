# Maintainer: Philipp Überbacher <murks@lavabit.com>
pkgname=nama-git
pkgver=20110819
pkgrel=1
pkgdesc="Tk/CLI frontend for ecasound"
arch=('any')
url="http://freeshell.de/~bolangi/cgi1/nama.cgi/00home.html"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.0' 'ladspa' 'ecasound' 'perl-anyevent>=5'
'perl-event' 'perl-parse-recdescent' 'perl-data-section'
'perl-file-find-rule' 'perl-modern-perl' 'perl-term-readline-gnu'
'perl-file-homedir' 'perl-yaml-tiny' 'perl-file-slurp'
'perl-file-copy-link' 'perl-graph' 'perl-text-format'
'perl-params-util' 'perl-audio-ecasound' 'perl-tk'
'perl-text-template' 'perl-io-all')
provides=('perl-audio-nama' 'nama')
conflicts=('nama')
optdepends=()
options=(!emptydirs)

_gitroot="git://github.com/bolangi/nama.git"
_gitname="nama.git"
_gitbranch="master"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  cd "${srcdir}/${_gitname}-build"
#  git checkout --track -b ${_gitbranch} origin/${_gitbranch}



  # Setting these env variables overwrites any command-line-options we don't want...

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  msg "build it!"

  cd src
  ./build || return 1

  msg "Perl, make me a nama..."
  
  cd ..
  # If using Makefile.PL
  { perl Makefile.PL &&
    make &&
    make test &&
    make install; }

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
