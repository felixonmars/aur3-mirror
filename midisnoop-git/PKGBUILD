# Maintainer: rtfreedman (rob<d0t>til<d0t>freedman<aT>gmail<d0t>com

pkgname=midisnoop-git
_gitname=midisnoop
pkgver=13.02937fa
pkgrel=1
pkgdesc="A simple MIDI monitor and prober"
arch=('i686' 'x86_64')
url="http://midisnoop.googlecode.com/"
license=('GPL2')
depends=('qt4' 'rtmidi')
provides=('midisnoop')
conflicts=('midisnoop')
makedepends=('git' 'python')
install="$pkgname.install"
source=("git+https://code.google.com/p/midisnoop/"
        "configure.patch"
        "$pkgname.install")

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
#  git describe --always | sed -e 's|-|.|g'
#  git describe --always | sed 's/^easytag.//;s/-/./g'
}

prepare() {
  cd "$_gitname"
  git apply "${srcdir}/configure.patch"
}

build() {
  cd "$_gitname"
  sed -i 's/"qmake"/"qmake-qt4"/' configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir/" install
}
md5sums=('SKIP'
         '6ba0852549e2e4f930b32d36cd81dce1'
         '676b644a04214e33bc03f98d3d17fe3e')
