# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Richard Jackson <Richard(at)Swanbourne(dot)com>
# Contributor: metsie <erik(at)familie(dash)metselaar(dot)nl>

pkgname=libgexiv2-git
_gitname=gexiv2
pkgver=0.10.0.r14.ga7e10b2
pkgrel=1
pkgdesc="A GObject-based wrapper around the Exiv2 library"
arch=('i686' 'x86_64')
url="http://trac.yorba.org/wiki/gexiv2/"
license=('GPL2')
depends=('exiv2>=0.21' 'glib2')
makedepends=('git' 'autoconf' 'automake')
provides=('libgexiv2')
conflicts=('libgexiv2')
source=('git://git.gnome.org/gexiv2')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}

  # Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  
  # Use current date
  # date +%Y%m%d

  # Use the most recent annotated tag reachable from the last commit
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/gexiv2.//'
}

build() {
  cd ${_gitname}

  ./autogen.sh
  ./configure --prefix=/usr --enable-introspection
  make
}
         
package() {
  cd ${_gitname}

  make DESTDIR=${pkgdir} install
}
