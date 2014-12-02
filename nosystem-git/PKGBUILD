# Maintainer Jack Frost <fbt@fleshless.org>

pkgname='nosystem-git'
pkgdesc='a tiny library which replaces libsystemd with stubs'
license='LGPL'
pkgver=0.2_2
pkgrel=1
arch='any'
url='https://github.com/dimkr/nosystem'

provides='libsystemd'
conflicts='libsystemd'

source=( "${pkgname}::git://github.com/dimkr/nosystem.git" 'makefile.patch' 'nosystem-git.install' )

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "0.`git rev-list HEAD | wc -l`_${pkgrel}"
}

build() {
	cd "${srcdir}/${pkgname}"
	patch -p0 < "${srcdir}/makefile.patch"
	make LIB_DIR=/usr/lib
}

package() {
	cd "${srcdir}/${pkgname}"

	make LIB_DIR=/usr/lib DESTDIR="$pkgdir" install

	cd "${pkgdir}/usr/lib"
	for i in libsystemd-daemon libsystemd-id128 libsystemd-journal libsystemd-login; do
		ln -s libsystemd.so "${i}.so"
	done
}

sha1sums=('SKIP'
          '0f71e2d07672e9419e12c043c617449704cd6715'
          'b7e76cf30d6bcf3c9238e74a180ca0ffeac451b5')
