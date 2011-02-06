# $Id: PKGBUILD 78653 2010-04-27 18:38:08Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=libsoup
pkgname='libsoup-gnome-lxpolkit'
pkgdesc="GNOME HTTP Library using lxpolkit instead of gnome-keyring."
pkgver=2.30.2
pkgrel=3
arch=(i686 x86_64)
license=('LGPL')
depends=("libsoup=${pkgver}" 'libproxy>=0.2.3' 'lxpolkit-git')
makedepends=('glib2>=2.24.0' 'gnutls>=2.8.6' 'libxml2>=2.7.7' 'libproxy>=0.2.3' 'sqlite3>=3.6.23' 'intltool' 'pkgconfig' 'gobject-introspection>=0.6.10')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgbase}/2.30/${pkgbase}-${pkgver}.tar.bz2)
provides=("libsoup-gnome=${pkgver}")
conflicts=('libsoup-gnome')
options=('!libtool' '!emptydirs')
sha256sums=('78ccbce84fccc74a49fb8168eeb409a6429a8a5854f197261d4108b8bb106bf6')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --without-gnome || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}"  install || return 1
  rm -f "${pkgdir}"/usr/lib/libsoup-2.4.*
  rm -f "${pkgdir}/usr/lib/pkgconfig/libsoup-2.4.pc"
  rm -rf "${pkgdir}/usr/include/libsoup-2.4"
  rm -rf "${pkgdir}/usr/share"
}
