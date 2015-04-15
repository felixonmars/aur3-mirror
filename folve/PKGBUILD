# Maintainer:  Ttz_ztT <no@mail.de>
pkgname=folve
pkgver=20121209
pkgrel=5
pkgdesc="Convolving audio files easily"
arch=('i686' 'x86_64')
url="https://github.com/hzeller/folve"
license=('GPL3')
depends=('fuse' 'zita-convolver' 'libmicrohttpd' 'libsndfile')
makedepends=('git')
provides=('folve')
conflicts=('folve')
options=('emptydirs')
source=("git://github.com/hzeller/folve.git")
md5sums=('SKIP')
_gitname="folve"


build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"

  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r demo-filters "$pkgdir/usr/share/$pkgname"
}

pkgver() {
  cd "$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

