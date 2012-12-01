# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Emmanuel 'guinness' Boudreault

pkgname=guile-devel
pkgver=2.0.7
pkgrel=1
pkgdesc="Guile is a portable, embeddable Scheme implementation written in C"
url="http://www.gnu.org/software/guile/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmp>=4.3.1' 'libtool' 'ncurses>=5.7' 'texinfo'
         'libunistring' 'gc' 'libffi')
conflicts=('guile' 'guile-git')
provides=("guile=$pkgver")
install=guile.install
options=('!libtool')
source=(http://ftp.gnu.org/pub/gnu/guile/guile-${pkgver}.tar.xz)
sha256sums=('6f278fa699685382ae51ba8bfad5840959e0af6414f3ad803d61131567bfa338')

build() {
  cd "${srcdir}/guile-${pkgver}"

  ./configure --prefix=/usr
  make LDFLAGS+="-lpthread"
}

package() {
  cd "${srcdir}/guile-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
