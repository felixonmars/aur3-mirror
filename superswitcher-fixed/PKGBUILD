# Maintainer: Eivind Eide <xenofil A-T gmail D-O-T com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Achraf cherti <achrafcherti@gmail.com>

pkgname='superswitcher-fixed'
_realname='superswitcher'
pkgver='0.6'
pkgrel='1'
pkgdesc='Powerful window and workspace switching using the Super key - fixed'
arch=('i686' 'x86_64')
url='http://code.google.com/p/superswitcher/'
license=('GPL')
depends=('gconf' 'libwnck' 'dbus-glib')
makedepends=('intltool')
provides=('superswitcher')
conflicts=('superswitcher' 'superswitcher-svn')
source=("http://superswitcher.googlecode.com/files/${_realname}-${pkgver}.tar.gz"
	"accumulated-fixes.diff")
md5sums=('e8620c8502dccc3f3d3d84e0eb359142'
	 'f5934a97adcdc02264eb08b26a7669ef')
options=('!emptydirs')

build() {
  cd "${_realname}-${pkgver}"

  patch -Np2 < ../../accumulated-fixes.diff

  aclocal

  autoconf

  automake \
    --add-missing

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "${_realname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
}

