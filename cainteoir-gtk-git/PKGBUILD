# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
pkgname=cainteoir-gtk-git
_gitname=cainteoir-gtk
pkgver=0.9.r5.ge551a5a
pkgrel=1
pkgdesc="A Gtk+/GNOME graphical front-end to the cainteoir-engine library."
arch=('i686' 'x86_64')
url="https://github.com/rhdunn/cainteoir-gtk"
license=('GPL3')
makedepends=('git')
depends=('cainteoir-engine' 'gtk3')
provides=('cainteoir-gtk')
conflicts=('cainteoir-gtk')
source=("git+https://github.com/rhdunn/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed -r 's/^cainteoir-gtk-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir/" install
} 

