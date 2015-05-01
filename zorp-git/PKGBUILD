_pkgname=zorp
pkgname="${_pkgname}-git"
pkgver=v6.0.0.0
pkgrel=1
pkgdesc="Zorp advanced protocol analyzing firewall"
arch=('i686' 'x86_64')
url="https://github.com/balabit/zorp"
license=('GPL')
depends=('glibc' 'libzorpll')
makedepends=('git' 'yasm')
provides=("$_pkgname")
conflicts=("$_pkgname")
provides=('zorp')
install="${_pkgname}.install"
source=("git+https://github.com/balabit/zorp.git#branch=6.0.0" "zorp.install")
md5sums=('SKIP'
         'f08d8b3a94cdff1e0ed54ee8932a7fc6')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	PYTHON=/usr/bin/python2 ./configure \
		--sbindir=/usr/bin \
		--enable-ipv6 \
		--enable-ip-options \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--localstatedir=/var/lib/zorp \
		--sysconfdir=/etc \
		--with-pidfiledir=/run/zorp/
	find "$srcdir/$_pkgname" -name Makefile | xargs -- sed -re 's/ -Werror( |$)/ /g' -i --
	find "$srcdir/$_pkgname" -name Makefile | xargs -- sed -re 's/ --install-layout=deb/ /g' -i --
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR=${pkgdir} install 
}
