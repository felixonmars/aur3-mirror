# Maintainer: John Piasetzki <john.piasetzki@gmail.com>
pkgname=empathy-indicate
_realpkgname=empathy
pkgver=2.31.3
_pkgbranch=2.31
pkgrel=1
pkgdesc="A GNOME instant messaging client using the Telepathy framework. Patched for libindicate & notify-osd."
arch=('i386' 'x86_64')
url="http://live.gnome.org/Empathy"
license=('GPL2')
groups=('gnome-extra')
depends=('gnome-common' 'gettext' 'libxml2' 'libx11' 'libnotify' 'libunique' 'libgnome-keyring')
makedepends=()
optdepends=()
provides=('empathy')
conflicts=('empathy')
replaces=('empathy')
backup=()
options=()
install=
changelog=
source=(http://download.gnome.org/sources/empathy/2.31/$_realpkgname-$pkgver.tar.gz)
noextract=()
md5sums=('cb8df29db30c667102c468445829a71a') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$_realpkgname-$pkgver"

  ./configure --prefix=/usr --enable-libindicate --enable-shave
  make
}

package() {
  cd "$srcdir/$_realpkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
