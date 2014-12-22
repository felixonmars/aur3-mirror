# Contributor: Jeremy Cowgar <jeremy@cowgar.com>
pkgname=lsh
_pkgver=2.99
pkgver=2.99.r9840.g5bb9d9b
pkgrel=2
pkgdesc="SSH client/server"
license=('GPL')
arch=('i686' 'x86_64')
url="https://www.lysator.liu.se/~nisse/lsh/"
depends=('liboop' 'nettle')
source=("git+https://git.lysator.liu.se/lsh/lsh.git")
sha1sums=('SKIP')

pkgver() {
  cd lsh
  echo "$_pkgver.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd lsh
  ./.bootstrap
  ./configure \
    --prefix=/usr             \
    --sysconfdir=/etc         \
    --sbindir=/usr/bin        \
    --libexecdir=/usr/lib/lsh \
    ;
  sed -i '/^TARGETS/ s/\<lsh\.pdf\>//' doc/Makefile
  make -j1
}

package() {
  cd lsh
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/info/dir"
}

# vim: ts=2:sw=2:et
