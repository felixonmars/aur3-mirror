#Maintainer: Techlive Zheng <techlivezheng@gmail.com>
#Contributor: ilikenwf / Matt Parnell <parwok@gmail.com>

_pkgname=libxtrans
pkgname=xtrans-git
pkgver=1.3.2.8.ge1e6121
pkgrel=1
pkgdesc="X transport library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
makedepends=('git')
provides=('xtrans')
replaces=('xtrans')
conflicts=('xtrans')
source=('git://anongit.freedesktop.org/git/xorg/lib/libxtrans')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --always | sed -e 's/^xtrans-//g' -e 's|-|.|g'
}


build() {
  cd "$_pkgname"

  ./autogen.sh \
      --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname"
}
