# Maintainer: kevku <kevku@msn.com>
pkgname=perl-parse-titlesyntax
pkgver=0.77
pkgrel=1
pkgdesc="A parser and VM for foobar2000's title syntax"
arch=('any')
url="https://github.com/Kovensky/Parse-TitleSyntax"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-common-sense')
makedepends=('git')
options=(!emptydirs)

_gitroot="https://github.com/Kovensky/Parse-TitleSyntax.git"
_gitname="Parse-TitleSyntax"

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
