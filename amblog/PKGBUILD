# Maintainer: Alf <naihe2010@126.com>
pkgname=amblog
pkgver=20110908
pkgrel=1
pkgdesc="amblog is a multiple blog post"
arch=('i686' 'x64')
url="http://github.com/naihe2010/amblog"
license=('GPL')
depends=('perl' 'perl-gtk2-webkit' 'perl-net-oauth' 'perl-xmlrpc-frontier')
makedepends=('git')
source=()
_gitroot='http://github.com/naihe2010/amblog.git'
_gitname='amblog'
md5sums=()

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
