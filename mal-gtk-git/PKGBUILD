pkgname=mal-gtk-git
_pkgname=mal-gtk
epoch=1
pkgver=0.r45.g34dd78c
pkgrel=1
pkgdesc="GTK+3 anime manager interface for MyAnimeList.net"
arch=('i686' 'x86_64')
url="https://github.com/talisein/mal-gtk"
license=('GPL')
depends=('gnome-keyring' 'glibmm' 'gtkmm3' 'libsecret')
provides=('mal-gtk')
conflicts=('mal-gtk')

source=("git://github.com/talisein/mal-gtk.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h" )"
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
