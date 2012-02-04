# Maintainer: kevku <kevku@msn.com>
pkgname=perl-digest-ed2k
pkgver=0.1.0
pkgrel=1
pkgdesc="Perl implementation of the ED2k hash used in ED2K URIs."
arch=('any')
url="https://github.com/Kulag/Digest-ED2K"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-exporter-tidy' 'perl-common-sense' 'perl-digest-md4')
makedepends=('git')
options=(!emptydirs)

_gitroot="https://github.com/Kulag/Digest-ED2K.git"
_gitname="Digest-ED2K"

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

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_gitname-build"
  perl Build install
} 
