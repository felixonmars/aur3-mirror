# Maintainer: Stephen Martin <stephensrmmartin at gmail.com>
pkgname=spice-gtk3-git
_pkgname=spice-gtk3
pkgver=20141217
pkgrel=1
pkgdesc="A Gtk client and libraries for SPICE remote desktop servers (gtk3 version)."

pkgver() {
    cd "$pkgname"
      git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
    }

arch=('x86_64' 'i686')
url="http://spice-space.org"
license=('GPL')
makedepends=('intltool' 'git' 'python2-pyparsing' 'vala' 'perl-text-csv' 'gtk-doc')
depends=('libpulse' 'gtk3' 'spice' 'libusb' 'usbredir')
conflicts=('spice-gtk' 'spice-gtk3')
provides=('spice-gtk3')
options=('!libtool')
source=('spice-gtk::git://anongit.freedesktop.org/spice/spice-gtk' 
        'git+http://cgit.freedesktop.org/spice/spice-common'
        'git+http://cgit.freedesktop.org/spice/spice-protocol'
)
prepare(){
  cd $srcdir/spice-gtk
  sed -i 's|#define SPICE_GTK_MICRO_VERSION.*|#define SPICE_GTK_MICRO_VERSION (0)|g' gtk/spice-version.h*
  git submodule update --init --recursive
  sed -i 's,/usr/bin/env python,/usr/bin/python2,' spice-common/spice_codegen.py
}

build() {
  cd "$srcdir/spice-gtk"
  #./configure --enable-maintainer-mode --with-gtk=3.0 --prefix=/usr
  PYTHON=python2 ./autogen.sh --with-gtk=3.0 --prefix=/usr

  make
}

package() {
  cd "$srcdir/spice-gtk"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         'SKIP'
         'SKIP')
