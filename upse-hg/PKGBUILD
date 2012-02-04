# Maintainer: Christopher Rosell <chrippa@tanuki.se>

# aur split package hacks
pkgname='upse-hg'
true && pkgname=(libupse-hg upse123-hg)

pkgbase='upse-hg'
pkgver=227
pkgrel=1
pkgdesc='UPSE is an advanced playstation sound emulator which concentrates on sound correctness'
arch=('i686' 'x86_64')
url='http://nenolod.net/projects/upse/'
license=('GPL')
makedepends=(mercurial libao)
source=('makefile-fix.patch')
md5sums=('c839a257ec0c7d8a3ff1e74abe18b7cf')

_hgroot='http://hg.atheme.org/unofficial'
_hgrepo='upse'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  patch -p1 < $startdir/makefile-fix.patch
  ./autogen.sh
  ./configure --prefix=/usr --disable-audplugin --enable-ao
  make
}

package_libupse-hg() {
  provides=(libupse)
  conflicts=(libupse)
  depends=(zlib)

  cd "$srcdir/$_hgrepo-build/src/libupse"
  make DESTDIR="$pkgdir/" install
}

package_upse123-hg() {
  depends=(libupse-hg libao)
  provides=(upse123)
  conflicts=(upse123)

  cd "$srcdir/$_hgrepo-build/src/upse123"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=2 sw=2 et:
