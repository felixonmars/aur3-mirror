# Contributor: joyfulgirl@archlinux.us
pkgname=dillo-hg
pkgver=2522
pkgrel=1
pkgdesc="A small, fast, FLTK-based web browser"
arch=('i686' 'x86_64')
url="http://www.dillo.org/"
license=('GPL3')
depends=('fltk' 'libxi' 'libxinerama' 'openssl' 'perl')
makedepends=('autoconf' 'automake' 'mercurial')
optdepends=('ttf-dejavu: Enable DejaVu Sans support')
provides=('dillo=3.0.3')
conflicts=('dillo')
backup=('etc/dillo/dillorc' 'etc/dillo/dpidrc')
changelog=ChangeLog

source=('hg+http://hg.dillo.org/dillo/')
md5sums=('SKIP')
_hgrepo="dillo"


build() {
  cd ${srcdir}/${_hgrepo}

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/ \
      --enable-ssl \
      --enable-ipv6 \
      --enable-threaded-dns
  make
}

package() {
  cd ${srcdir}/${_hgrepo}
  make DESTDIR=$pkgdir install
}

# End of file
