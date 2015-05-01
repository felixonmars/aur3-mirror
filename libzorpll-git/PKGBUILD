_pkgname=libzorpll
pkgname="${_pkgname}-git"
pkgver=v6.0.0.0
pkgrel=1
pkgdesc="Zorp low-level library"
arch=('i686' 'x86_64')
url="https://github.com/balabit/libzorpll"
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm')
provides=("$_pkgname")
conflicts=("$_pkgname")
provides=('libzorpll')
source=("$_pkgname::git+https://github.com/balabit/libzorpll.git#branch=6.0.0.0")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr \
        --mandir=\$${prefix}/share/man \
        --infodir=\$${prefix}/share/info \
        --sysconfdir=/etc \
        --libexecdir=\$${libdir}/libzorpll \
        --localstatedir=/
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR=${pkgdir} install 
	rm -r $pkgdir/lib
	rm -r $pkgdir/run
}
