# Contributor: John Askew <john.askew@gmail.com>
pkgname="nipper-cli"
pkgver=0.12.0
pkgrel=1
pkgdesc="A tool for auditing network device configuration files"
arch=('i686', 'x86_64')
url="http://nipper.titania.co.uk"
license=('GPL3')
groups=()
depends=('libnipper')
makedepends=('cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://downloads.sourceforge.net/nipper/$pkgname-$pkgver.tgz")
noextract=()
md5sums=("6a160cafb0c043e2330756a2b7b83daf") #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build
  cd build
  cmake ../
  make || return 1
  make DESTDIR="$pkgdir/" install
  cd ..
}

# vim:set ts=2 sw=2 et:
