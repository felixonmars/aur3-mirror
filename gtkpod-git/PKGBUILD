# Maintainer: Richard Schwab <mail NOSPAM w.tf-w.tf>
# Contributor: SaThaRiel <sathariel74[at] gmail[dot]com>
# Contributor: Ahmed Osman <Ashex@aur>
 
pkgname=gtkpod-git
pkgver=2.1.3.12.g8030245
pkgrel=1
epoch=1
pkgdesc="a platform independent GUI for Apple's iPod using GTK2"
arch=('i686' 'x86_64')
url="http://gtkpod.sourceforge.net"
license=('GPL')
depends=('gettext' 'gtk2' 'libgpod-git' 'libid3tag' 'hicolor-icon-theme' 'anjuta')
makedepends=('autoconf' 'flex' 'git' 'intltool')
optdepends=('libmp4v2: MP4/h264 support' 'libcurl: for coverart download support' 'libgnome-vfs-2.0: for iPod autodetection under GNOME' 'libcurl: for coverart download support' 'libflac: for FLAC support' 'libvorbis: for ogg libvorbis support')
provides=('gtkpod')
conflicts=('gtkpod')
install=gtkpod.install
source=('gtkpod::git://git.code.sf.net/p/gtkpod/code')
md5sums=(SKIP)

pkgver() {
  cd gtkpod
  git describe --tags | sed "s/^gtkpod.//; s/-/./g"
}

build() {
  cd gtkpod

  ./autogen.sh --prefix=/usr
  make
}
  
package() {
  cd gtkpod

  make DESTDIR="$pkgdir" install
  cp src/org.gtkpod.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/
}
