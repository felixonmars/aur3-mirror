# Maintainer: Jason Gerecke <killertofu@gmail.com>

pkgname=evemu-git
pkgver=2.0.0.r42.ge97b7a9
pkgrel=1
pkgdesc="Tools and bindings for kernel input event device emulation and data capture and replay."
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Evemu/"
license=(GPL3)
makedepends=('git')
depends=('python' 'libevdev>=0.5')
optdepends=(
    'xmlto: build manpages'
    'asciidoc: build manpages'
)
provides=('evemu=$pkgver')
conflicts=('utouch-evemu' 'evemu')
replaces=('utouch-evemu')
options=('!libtool')
source=("$pkgname"::git://git.freedesktop.org/git/evemu#branch=master)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

