# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_name=gcompris
pkgname=$_name-git
pkgver=12.11.103.ge412eb5
pkgrel=1
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10 (git)"
arch=('i686' 'x86_64')
url="http://gcompris.net/"
license=('GPL3')
depends=('pygtk' 'pyxml' 'librsvg' 'python2-pysqlite'
         'gstreamer0.10-base-plugins')
optdepends=('gnucap: for computer simulation within the electricity activity'
            'tuxpaint: for the painting activity'
            'gnuchess: for the chess activity')
makedepends=('texinfo' 'texi2html' 'intltool' 'gettext' 'gnuchess' 'git'
             'gnome-common')
provides=($_name $_name-data)
conflicts=($_name $_name-data)
options=('!libtool')
source=(git://git.gnome.org/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe | sed 's/^v//;s/-/./g;s/_/./g;' | cut -d'.' -f2-
}

build() {
  cd $_name
  PYTHON=python2 ./autogen.sh --prefix=/usr
  make
}

package() {  
  cd $_name
  # This is fast ...
  make DESTDIR="$pkgdir" install-exec
  # ... but this takes time and use a lot of disk space (just for the record)
  make DESTDIR="$pkgdir" install-data
}
