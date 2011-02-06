# Maintainer: fiatguy85 fiatguy85 <at> gmail <dot> com
pkgname=torrentflux-ng-git
pkgver=20110126
pkgrel=1
pkgdesc="The webbased download tool (based on torrentflux-b4rt)"
arch=('any')
url="http://www.torrentflux-ng.org"
license=('GPL')
groups=()
depends=('apache' 'php' 'php-apache' 'mysql' 'php-gd' 'perl-xml-simple' 'perl-xml-dom' 'perl-digest-sha1' 'python2' 'openssl' 'glibc' 'zlib' 'libevent' 'curl')
makedepends=('git')
provides=('torrentflux-ng')
conflicts=('torrentflux-ng' 'torrentflux-b4rt')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/epsylon3/torrentflux.git"
_gitname="torrentflux"

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

  install -d $pkgdir/opt/$_gitname
  cp -R * $pkgdir/opt/$_gitname
}
