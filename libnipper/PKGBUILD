# Contributor: John Askew <john.askew@gmail.com>
pkgname="libnipper"
pkgver=0.12.6
pkgrel=1
pkgdesc="A library for auditing network device configuration files"
arch=('i686', 'x86_64')
url="http://nipper.titania.co.uk"
license=('GPL3')
groups=()
depends=()
makedepends=('cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://downloads.sourceforge.net/nipper/$pkgname-$pkgver.tgz")
noextract=()
md5sums=("daaeb9d4b50331ba7a9fb817fd1107be") #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build
  cd build
  cmake ../ || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  cd ..
}

# vim:set ts=2 sw=2 et:
