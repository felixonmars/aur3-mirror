# Maintainer: kevku <kevku@msn.com>
pkgname=perl-term-statusline
pkgver=0.01
pkgrel=1
pkgdesc="A small perl module for displaying the current status of on operation in a terminal."
arch=('any')
url="https://github.com/Kulag/Term-StatusLine"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-any-moose' 'perl-perl6-subs' 'perl-common-sense')
makedepends=('git')
options=(!emptydirs)

_gitroot="https://github.com/Kulag/Term-StatusLine.git"
_gitname="Term-StatusLine"

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
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/share/perl5/vendor_perl"
  cp -r lib/* "$pkgdir/usr/share/perl5/vendor_perl"
} 
