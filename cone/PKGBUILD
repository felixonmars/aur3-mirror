# Contributor: Peter Feuerer <peter[at]piie.net>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="cone"
pkgver=0.90
pkgrel=1
pkgdesc="A text-based mail client based, in part, on Courier libraries."
arch=('i686' 'x86_64')
url="http://www.courier-mta.org/cone/index.html"
license=('GPL2')
depends=('courier-authlib' 'courier-sox' 'libxml2' 'openssl' 'aspell' 'libldap' 'fam')
source=("http://downloads.sourceforge.net/courier/${pkgname}-${pkgver}.tar.bz2")

md5sums=('fce2ff83bef7294aca7caffa20090a6b')
sha512sums=('6446f868e07a54bda074e403ce48d590a55e97cf25b7e6172ba02df1242a232ade52840a837dd92e70253159cc637c17876876db01445c60374152262329ae27')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --with-socksgt --with-devel
	make || return 1
	make DESTDIR=${startdir}/pkg install
}

# vim:ts=4:sw=4:noet:enc=utf-8: 
