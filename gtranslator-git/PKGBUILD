# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_name=gtranslator
pkgname=${_name}-git
pkgver=2.91.6.28.ga03b029
pkgrel=1
pkgdesc="An enhanced gettext po file editor for the GNOME"
arch=('i686' 'x86_64')
license=('GPL')
url="http://projects.gnome.org/gtranslator"
depends=('desktop-file-utils' 'gdl' 'gettext' 'gtksourceview3' 'gtkspell3'
         'iso-codes' 'libgda' 'libpeas' 'gsettings-desktop-schemas'
         'hicolor-icon-theme' 'dconf')
makedepends=('git' 'intltool' 'gnome-doc-utils' 'gnome-common' 'gtk-doc'
             'yelp-tools' 'gucharmap' 'json-glib' 'gnome-dictionary')
optdepends=('gtkspell: spell check'
            'gucharmap: for charmap plugin'
            'json-glib: for open-tran plugin'
            'gnome-dictionary: for dictionary plugin')
conflicts=("$_name")
provides=("$_name")
options=('!libtool')
install=$_name.install
source=(git://git.gnome.org/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd $_name
  export CFLAGS="$CFLAGS -g -O1"
  export CXXFLAGS="$CXXFLAGS -g -O1"
  PYTHON=python2 ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/$_name --localstatedir=/var --disable-static \
    --enable-daap --enable-python --with-mdns=avahi --disable-scrollkeeper
  make
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" install
}
