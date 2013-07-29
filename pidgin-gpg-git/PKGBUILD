# Maintainer: vileda <vileda@vileda.cc>

pkgname=pidgin-gpg-git
_gitname=Pidgin-GPG
pkgver=20130729
pkgrel=1
pkgdesc="Transparently encrypts your instant messages with RSA encryption. Easy-to-use, but very secure."
arch=(i686 x86_64)
url="https://github.com/segler-alex/Pidgin-GPG"
license=('unknown')
depends=(pidgin)
source=('git+https://github.com/segler-alex/Pidgin-GPG.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  date +%Y%m%d
}

build() {
  cd $_gitname
  autoreconf -i
  ./configure
  make
}

package() {
  cd $_gitname
  install -Dm 644 src/.libs/pidgin_gpg.so "$pkgdir/usr/lib/pidgin/pidgin_gpg.so"
}
