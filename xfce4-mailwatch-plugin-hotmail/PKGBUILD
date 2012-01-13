# I have include the hotmail patch from: 
# https://bugzilla.xfce.org/show_bug.cgi?id=5638
# and remove the function gnutls_transport_set_lowat
# the main package is a copy from:

# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=xfce4-mailwatch-plugin-hotmail
pkgnameorig=xfce4-mailwatch-plugin
pkgver=1.1.0
pkgrel=4
pkgdesc="A mailbox watch/check plugin for the Xfce4 panel with hotmail patch"
arch=(i686 x86_64)
license=('GPL2')
url="http://spurint.org/projects/xfce4-mailwatch-plugin/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4' 'gnutls' 'libgcrypt' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
conflicts=('xfce4-mailwatch-plugin')
options=('!libtool')
install=${pkgnameorig}.install
source=(http://spuriousinterrupt.org/files/mailwatch/${pkgnameorig}-${pkgver}.tar.bz2
	xfce4-mailwatch-plugin-1.1.0-underlink.patch
	hotmail.patch
	mailwatch-net-conn.patch)
md5sums=('f84dce86be1d7f25f169f262aaacee4e'
         '47fe8588e3bb642e1b507a854927e6db'
         'ed65311d21b65c809a0dd388d5cb8104'
	     'd254f951aa9085e6bf3c5a7248a468f4')

build() {
  cd ${srcdir}/${pkgnameorig}-${pkgver}
  # fix for panel4.8 from Fedora
  #patch -p1 < hotmail.patch
  patch -Np1 -i ${srcdir}/hotmail.patch
  patch -Np1 -i ${srcdir}/mailwatch-net-conn.patch
  patch -Np1 -i ${srcdir}/xfce4-mailwatch-plugin-1.1.0-underlink.patch
  xdt-autogen
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--disable-debug
  make
}

package() {
  cd ${srcdir}/${pkgnameorig}-${pkgver}
  make DESTDIR=${pkgdir} install
}
