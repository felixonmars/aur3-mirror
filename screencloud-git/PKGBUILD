# Maintainer: Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

# Found typos, bugs or other problems? Feel free to create a pull-request:
# https://github.com/Nothing4You/PKGBUILDs

pkgname=screencloud-git
pkgver=r111.19a5903
pkgrel=1
pkgdesc="Easy to use screenshot sharing application."
arch=('i686' 'x86_64')
url=http://screencloud.net
license=('custom')
makedepends=('git')
depends=('qt4' 'quazip' 'libqxt' 'python2' 'python2-crypto')
optdepends=('python2-crypto')
options=(libtool)

source=(git://github.com/olav-st/screencloud.git)
sha512sums=('SKIP')

conflicts=(screencloud)

install=screencloud.install

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-*}"
  mkdir build
  cd build
  cmake ../screencloud -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 -DCONSUMER_KEY_SCREENCLOUD=a481cc54e974306901d8405f6fa936b705326e678 -DCONSUMER_SECRET_SCREENCLOUD=437ce504ec764891d6e166b82c05e31f
  make
}

package() {
  cd "${pkgname%-*}/build"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/screencloud/screencloud.sh "$pkgdir/usr/bin/screencloud"
}
