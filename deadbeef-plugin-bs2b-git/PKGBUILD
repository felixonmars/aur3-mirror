# Maintainer: doctorkohaku <maido.in.heaven at gmail.com>
# adjust by Cravix, just write once and run (away)... ok, take it if you like.

pkgname=deadbeef-plugin-bs2b-git
_pkgname=bs2b
pkgver=6.a1961cd
pkgrel=1
pkgdesc="headphone crossfeed for deadbeef using libbs2b"
url="http://gitorious.org/deadbeef-sm-plugins/pages/Home"
arch=('i686' 'x86_64')
license='GPL2'
depends=('deadbeef' 'libbs2b')
makedepends=('git')

source=("git://gitorious.org/deadbeef-sm-plugins/bs2b.git")
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 bs2b.so "$pkgdir/usr/lib/deadbeef/bs2b.so" 
}
