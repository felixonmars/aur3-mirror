# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=cl-shop2-sbcl
_clname=shop2
pkgver=2.9.0
pkgrel=1
pkgdesc="SHOP (Simple Hierarchical Ordered Planner) is a domain-independent automated-planning system that is based on ordered task decomposition, which is a type of Hierarchical Task Network (HTN) planning"
arch=('i686' 'x86_64')
url="http://www.cs.umd.edu/projects/shop/description.html"
license=('GPL')
depends=('sbcl' 'cl-asdf')
source=(http://downloads.sourceforge.net/project/shop/${_clname}-${pkgver}.tar.gz
		shop2.install)
install=shop2.install
md5sums=('2d5a41d420cca0ccb11d15072a770dac'
		 '144aff7ee86f492a03117e3c52b31b24')
sha256sums=('69f552d5a6f7e25fb3213910dada43dc1529f2071115a3abc8745a405ece59f0'
			'810394bd9f545d76fae944862327f437c7aadb8305d8e109b3cf8855f9a25fd5')
sha384sums=('8217ab28a650a983bd62a3c52f1a958987c0f054e79fa34373ed024bd048d0bc5392262d6ede7f16e4d26cbe4cc4ca6f'
			'0c4e81914d82c59ebc58410f790029a5efec3fe9e4334706c173e2769be5e67d47728670fa82b6f96d65c89e6692340e')
sha512sums=('058d2150154af6f0127dd4f3c4a6d44b9a5dc09c2e593c462efd0f9e53c4785da363a72bd8a9ca9265351bd7800d20041107c9caf228565db4c5984ef34ef8f6'
			'b321713da4f5275bdf4fe0f5e4d2f1daad085f50f96ea5974dcce239e14b3ef1f9c19850986a31ca02fb51d7b12459a8a6b62a66f50f21c397767261251f5999')


build() {
	cd "${srcdir}/${_clname}-${pkgver}"
}

package() {
	cd "${srcdir}/${_clname}-${pkgver}"
	
	install -dm 755 "${pkgdir}/usr/share/common-lisp/source/${_clname}"
	cp -r * "${pkgdir}/usr/share/common-lisp/source/${_clname}"
	
	install -dm 755 "${pkgdir}/usr/share/common-lisp/systems"
	cd "${pkgdir}/usr/share/common-lisp/systems"
	ln -s ../source/${_clname}/${_clname}.asd .
}

