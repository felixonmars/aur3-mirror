# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4

pkgname=libreoffice-gtk-only-ultralite
pkgver=4.2.8
pkgrel=2
pkgdesc="Simply makes LibreOffice-Still use GTK theme without any Gnome dependencies"

url="http://www.libreoffice.org/"
arch=('i686' 'x86_64')
license=('LGPL3')

depends=('libreoffice-still-common')
conflicts=('libreoffice-still-gnome')
provides=('libreoffice-still-gnome')

# Change this to a mirror nearby if you want
_MIRROR='http://mirrors.kernel.org/archlinux'

# Idea of sourcing the original package by Stebalien <steven@stebalien.com>
# Splitting URL because of the 80 characters rule I still like and obey to :)
_FILENAME="libreoffice-still-gnome-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
source=("${_MIRROR}/extra/os/${CARCH}/${_FILENAME}")

sha256sums=('2b8dafc8c2b224b08fe2fada980ff900fbd4e52f8a346196e9d7852d8f7cac2a')

package() {
	cd ${srcdir}
	_LODIR='usr/lib/libreoffice/program'
	_LIBNAME='libvclplug_gtklo.so'
	_LIB3NAME='libvclplug_gtk3lo.so'
	install -dm755 ${pkgdir}/$_LODIR/
	install -Dm755 ${srcdir}/$_LODIR/$_LIBNAME ${pkgdir}/$_LODIR/
	install -Dm755 ${srcdir}/$_LODIR/$_LIB3NAME ${pkgdir}/$_LODIR/
}
