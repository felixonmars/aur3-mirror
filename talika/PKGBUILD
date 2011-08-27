# Contributor: zhuqin

pkgname=talika
pkgver=0.50
pkgrel=1
pkgdesc="GNOME panel applet to switch between open windows using icons."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/talika/"
license=('GPL2')
depends=('gnome-panel')
makedepends=('intltool')
install=$pkgname.install
source=(http://sourceforge.net/projects/talika/files/$pkgname-$pkgver/${pkgname}_${pkgver}-1.tar.gz)
md5sums=('4108e366cc3de8247bd2baad3d9f2509')
options=('!docs')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr \
	--libexecdir=/usr/lib/$pkgname \
	--with-gconf-schema-file-dir=/usr/share/gconf/schemas || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
