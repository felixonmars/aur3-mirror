# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Johannes Pfau <johannespfau at gmail dot com>

_name=notify-osd
pkgname=$_name-gtk2
pkgver=0.9.30
pkgrel=2
pkgdesc="Canonical's on-screen-display notification agent. Gtk2 version."
arch=('i686' 'x86_64')
url="https://launchpad.net/notify-osd"
license=('GPL')
depends=('gconf' 'libwnck' 'libnotify')
provides=('notification-daemon')
source=("http://launchpad.net/$_name/natty/natty-alpha3/+download/$_name-$pkgver.tar.gz")
md5sums=('aa52780eb7be9eab6d6bd3a6b055ac09')

build() {
  cd "$srcdir/$_name-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir=/usr/lib/$_name \
              --disable-static

  # disable tests
  sed -i '/^SUBDIRS/s/tests //' Makefile  

  make
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR="$pkgdir/" install
}
