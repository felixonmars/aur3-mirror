# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gcalccmd
_srcname=gcalctool
pkgver=6.2.0
pkgrel=1
pkgdesc="Standalone CLI calculator from gcalctool"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('intltool' 'gnome-doc-utils')
conflicts=('gcalctool')
options=(!emptydirs)
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${_srcname}/${pkgver%.*}/${_srcname}-${pkgver}.tar.xz)
sha256sums=('ddc2efe25220e9341832304dfd9e5e2390a70bb6bd70d1afeb49da88023cdffb')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-scrollkeeper --disable-schemas-compile --disable-nls
  make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf ${pkgdir}/usr/bin/{gcalctool,gnome-calculator} \
         ${pkgdir}/usr/share/{applications,gcalctool,gnome,glib-2.0}
         #${pkgdir}/usr/share/man/man1/gcalctool.1
}
