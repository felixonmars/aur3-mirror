# Maintainer: speps <speps at aur dot archlinux dot org>

_name=gtk-engine-equinox
pkgname=lib32-$_name
pkgver=1.50
pkgrel=1
pkgdesc="A heavily modified version of the beautiful Aurora engine. Multilib."
arch=('x86_64')
url='http://gnome-look.org/content/show.php/Equinox+GTK+Engine?content=121881'
license=('GPL')
depends=('lib32-gtk2' "$_name")
makedepends=('gcc-multilib' 'intltool' 'perl')
options=('!libtool')
source=("http://gnome-look.org/CONTENT/content-files/121881-equinox-$pkgver.tar.gz")
md5sums=('f5ab68e50e128ee5186265b80d5cf1bd')

build() {
  cd "$srcdir/equinox-$pkgver"

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # toolbar fix
  sed -i "s|\(EQUINOX_IS_TOOLBAR.*parent\)|widget \&\& \1|" src/equinox_style.c

  # glib2 fix
  sed -i "/gtimer/d" src/animation.c

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-animation
  make
}

package() {
  cd "$srcdir/equinox-$pkgver"
  make DESTDIR="$pkgdir" install
}