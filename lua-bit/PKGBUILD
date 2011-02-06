# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Maintainer: Laszlo Papp <djszapi at archlinux us>

pkgname=lua-bit
pkgver=25
pkgrel=2
pkgdesc="bit manipulation library development files for the lua"
arch=('i686' 'x86_64')
url="http://lua-gtk.luaforge.net/en/index.html"
license=('GPL')
depends=('lua')
options=(!libtool)
source=('http://luaforge.net/frs/download.php/3065/bitlib-25.tar.gz')
md5sums=('18f124c80c685f2269296a7172e600fe')

build()
{
 cd ${srcdir}/bitlib-${pkgver}
 ./configure --prefix=/usr
 make || return 1
 make DESTDIR=${pkgdir} install || return 1
}
