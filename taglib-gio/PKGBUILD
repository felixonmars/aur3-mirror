# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=taglib-gio
pkgver=0.4
pkgrel=1
pkgdesc="A port of the popular TagLib to use the GIO I/O framework"
arch=('i686' 'x86_64')
url="http://files.backtrace.info/releases/taglib-gio"
license=('GPL')
depends=('bash' 'glib2' 'zlib')
makedepends=('pkgconfig')
options=(!libtool)
source=(${url}/${pkgname}-${pkgver}.tar.gz)
md5sums=('5194addf9d58e7ee0fc8e967d4938850')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
