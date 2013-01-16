# Maintainer: Garrett Hartshaw <ghartshaw@gmail.com>
pkgname=gtlm-git
pkgver=20130113
pkgrel=1
pkgdesc="A LED manager for MSI GT series laptops"
arch=('i686' 'x86_64')
url="http://github.com/aljen/gtlm"
license=('MIT')
depends=('libconfig' 'libusb')
makedepends=('git')
provides=('gtlm')
install='gtlm.install'
source=('50-gtlm.rules' 'LICENSE')
md5sums=('3e6c983a0cfe7917f65b6de3f42bbb9c'
         '537f78adda579ac5e91774874caa2f01')

_gitroot=git://github.com/aljen/gtlm.git
_gitname=gtlm

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  msg "Cloning..."
  if [[ -d "$_gitname" ]]; then
    rm -rf "$_gitname"
  fi
  git clone "$_gitroot" "$_gitname" --depth 1
  cd "$srcdir/$_gitname"
  ./build.sh
}

package() {
  install -m755 -D "$srcdir/$_gitname/gc" "$pkgdir/usr/bin/gc"
  install -m644 -D 50-gtlm.rules "$pkgdir/etc/udev/rules.d/50-gtlm.rules"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
