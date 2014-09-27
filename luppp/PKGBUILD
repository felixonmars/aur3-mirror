# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=luppp
pkgver=1.0.1
pkgrel=1
pkgdesc="A live looping tool (OpenAV)"
arch=('i686' 'x86_64')
url="http://openavproductions.com/luppp/"
license=('GPL3')
groups=('openav')
depends=('jack' 'liblo' 'ntk-git')
makedepends=('cmake')
source=("https://github.com/harryhaaren/openAV-Luppp/archive/release-$pkgver.tar.gz")
md5sums=('6c6db49fb10df3ef93d4b664644080f2')

build() {
  cd openAV-Luppp-release-$pkgver/build
  ./compile.sh
}

package() {
  cd openAV-Luppp-release-$pkgver/build/src
 install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
