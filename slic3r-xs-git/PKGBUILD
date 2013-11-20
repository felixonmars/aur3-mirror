# Maintainer: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=slic3r-xs-git
pkgver=0
pkgrel=10
pkgdesc="XS code for Slic3r"
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-extutils-parsexs>=3.22')
makedepends=('git')
provides=('slic3r-xs')
#Consider uncommenting line below in case of false negative test results ;)
#BUILDENV+=('!check')

_gitroot="git://github.com/alexrj/Slic3r"
_gitname="Slic3r"

prepare() {
  export _src_dir="$srcdir/$_gitname-build/xs"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  export SLIC3R_NO_AUTO="true"

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
    #TODO: check if it's the same origin
  else
    git clone --depth=1 $_gitroot $_gitname
    # specific branch
    #git clone --depth=1 -b branch_name $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$_src_dir"

  # Why true? cuz pacman is crazy... and it still doesn't work as intended
  true && pkgver="$(awk -F\' '/our \$VERSION/{gsub(/-dev/,"",$2); print $2 }' ./lib/Slic3r/XS.pm).$(git rev-parse --short HEAD)"
  export _pkgver="$pkgver"
  msg2 "Fetched $_pkgver"

  # Revert faulty fix
  #echo "std::vector< unsigned int >*  T_STD_VECTOR_UINT_PTR" >> .//xsp/my.map
}

build() {
  cd "$_src_dir"
  warning " ⚠  DO NOT respond to any question with 'yes'. Report a bug in comment instead.\n"
  warning "Running Slic3r under Perl >= 5.16 is not supported nor recommended\nIn case of related to this issues please use ARM repository to get older perl package\n"
  # Cuz cpan will install fixes to $HOME ... which is not the point of this package

  # Build stage
  /usr/bin/perl Build.PL
  ./Build

}

check () {
  cd "$_src_dir"
  ./Build test
}

package () {
  cd "$_src_dir"
  ./Build install
  
  # Why double? 1st one was just for messages, this one is for real
  true && pkgver=$_pkgver
}

