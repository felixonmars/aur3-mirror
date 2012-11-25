# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

_pkgname=gnumeric
pkgname=$_pkgname-devel
pkgver=1.11.90
pkgrel=1
pkgdesc="A GNOME Spreadsheet Program (development release)"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/gnumeric/"
license=('GPL')
depends=('goffice-devel' 'dconf' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gnome-doc-utils' 'python2-gobject2' 'psiconv')
optdepends=('python2-gobject2: for python plugin support'
            'psiconv: for Psion 5 file support')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('96467a8b32d121af806b0fbfc01ebfcbeb3c05ed03345c5d4239d55fcaf5a47e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
