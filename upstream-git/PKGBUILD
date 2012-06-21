# Maintainer: kevku <kevku@gmx.com>
pkgname=upstream-git
pkgver=20120621
pkgrel=1
pkgdesc="Upload river files to usenet"
arch=('any')
url="http://isc-usenet.github.com/Upstream/"
license=('public domain')
depends=('python2' 'python2-yenc' 'python2-gevent')
makedepends=('git')

_gitroot=https://github.com/isc-usenet/Upstream.git
_gitname=Upstream

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
  install -Dm755 river2nzb.py $pkgdir/usr/bin/river2nzb
  install -Dm755 upstream.py  $pkgdir/usr/bin/upstream
}

# vim:set ts=2 sw=2 et:
