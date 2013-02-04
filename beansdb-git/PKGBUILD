# Maintainer: Jiangge Zhang <tonyseek at gmail dot com>

pkgname=beansdb-git
pkgver=20130204
pkgrel=1
pkgdesc="Yet anonther distributed key-value storage system from Douban Inc."
arch=('i686', 'x86_64')
url="http://code.google.com/p/beansdb/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'autoconf')
provides=('beansdb')
conflicts=('beansdb-svn')

_gitroot=git://github.com/douban/beansdb.git
_gitname=beansdb

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

  ./autogen.sh
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
