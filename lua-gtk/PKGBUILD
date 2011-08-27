# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Maintainer: Laszlo Papp <djszapi at archlinux us>

pkgname=lua-gtk
pkgver=0.9
pkgrel=3
pkgdesc="This package contains the Lua bindings for the Gtk library."
arch=('i686' 'x86_64')
url="http://lua-gtk.luaforge.net/en/index.html"
license=('LGPL' 'MIT')
depends=('lua' 'libffi' 'luafilesystem' 'luaexpat' 'lua-bit' 'luadoc' 'cmph')
makedepends=('gccxml')
source=('http://luaforge.net/frs/download.php/3654/lua-gtk-0.9.tar.gz' 'patch')

md5sums=('2370a0b4e55427b40f36b7c7d247bd63'
         '1e7a795664267b716716518e4f702ecf')
sha256sums=('81dcc75ce7d6672515f024c5ac054deac95f59c61ad84cc6e0fa433af7216732'
            '950cb0f1f993ec99bb14f6beed641fe87526f80ca40cb13205521ef5bab7a76d')

build()
{
	cd $srcdir/$pkgname-$pkgver
	patch -p1 < $startdir/patch
	./configure.lua
	sed -i "s/^\(CFLAGS.*\)$/\1 \$(LIBFFI_LIB)/;s|/usr/local/|/${pkgdir}/usr/|g" build/*/config.make
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}
