# Contributor: twa022 <twa022 at gmail dot com>

pkgname=vala-09
_pkgname=vala
pkgver=0.9.8
pkgrel=3
pkgdesc="Compiler for the GObject type system 0.9 branch"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('glib2')
makedepends=('libxslt')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/0.9/${_pkgname}-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/opt/vala-09 --enable-vapigen
  make
  make DESTDIR="${pkgdir}" install
  mkdir -p ${pkgdir}/usr/bin
  cat > ${pkgdir}/usr/bin/valac-09 <<- __EOF__
	#!/usr/bin/env bash
	LD_PRELOAD='/opt/vala-09/lib/libvala-0.10.so.0' /opt/vala-09/bin/valac --vapidir='/opt/vala-09/share/vala-0.10/vapi' "\$@"
	exit 0
	__EOF__
  chmod 755 ${pkgdir}/usr/bin/valac-09
  
}

md5sums=('bb0c56845d0da349cbfd71d8645876f4')
