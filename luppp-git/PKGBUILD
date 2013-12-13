# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=luppp-git
pkgver=release.1.0.r8.g04bff4c
pkgrel=1
pkgdesc="A live looping tool (OpenAV)"
arch=(i686 x86_64)
url="http://openavproductions.com/luppp/"
license=('GPL3')
depends=('jack' 'liblo' 'ntk-git')
makedepends=('git' 'cmake')
provides=('luppp')
conflicts=('luppp')
source=("$pkgname::git+https://github.com/harryhaaren/openAV-Luppp.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd $pkgname/build
  ./compile.sh
}

package() {
  cd $pkgname/build/src
  install -Dm755 luppp "$pkgdir/usr/bin/luppp"
}

# vim:set ts=2 sw=2 et:
