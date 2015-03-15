# Maintainer: Andrew Gigena <andrew_ultimate@hotmail.com>
pkgname=gimp-devel
pkgver=2.9.1.309
pkgrel=1
pkgdesc='The GIMP unstable version'
arch=('i686' 'x86_64')
url='https://github.com/andrewgigena/gimp-devel'
license=('GPL' 'LGPL')
depends=('pygtk' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng' 'dbus-glib' 'libexif' 'jasper' 'desktop-file-utils' 'hicolor-icon-theme' 'openexr' 'gegl-git' 'babl-git' 'docbook-xsl')
makedepends=('webkitgtk2' 'poppler-glib' 'alsa-lib' 'iso-codes' 'curl' 'ghostscript' 'cmake' 'git' 'make' 'gcc')
replaces=('')
options=('!makeflags')
conflicts=('gimp')
install=gimp-devel.install
source=('git://git.gnome.org/gtk-doc'
	'git://git.gnome.org/gexiv2'
	'https://github.com/andrewgigena/intltool.git'
	'https://github.com/andrewgigena/gimp-devel.git')

_gitroot=GITURL
_gitname=('gtk-doc'
          'gexiv2'
          'intltool'
          'gimp-devel')

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
