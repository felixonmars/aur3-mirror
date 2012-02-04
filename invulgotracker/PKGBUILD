# Contributor: Jano Gaspar <klingger at great sk>

pkgname=invulgotracker
pkgver=1.10
pkgrel=1
pkgdesc="Simple application to track time usage on your tasks & projects."
arch=('i686' 'x86_64')
url="http://www.invulgo.dk/"
license=('GPL')
depends=('libglade' 'gnome-vfs')
source=(http://invulgotracker.googlecode.com/files/invulgotracker-$pkgver.tar.gz)
md5sums=('09dcb74b27ad4bf2a57a4d8454436a17')

build() {
  cd "$srcdir/invulgotracker-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}