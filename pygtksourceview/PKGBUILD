# Contributor: Aliaksandr Stelmachonak <mail.avatar at gmail dot com>

pkgname=pygtksourceview
pkgver=1.1.0
pkgrel=3
pkgdesc="Python bindings for gtksourceview"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtksourceview' 'pygtk')
makedepends=('pkgconfig' 'gnome-python-desktop')
options=('!libtool')
url="http://www.gnome.org"
source=(http://sunet.dl.sourceforge.net/project/${pkgname}/${pkgname}/1.1/${pkgname}-${pkgver}.tar.gz)
md5sums=('1baf937a7d11c10ce97674daefb4f578')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var --disable-static --disable-docs
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
