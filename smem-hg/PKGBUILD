# Maintainer: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
pkgname="smem-hg"
pkgver=73
pkgrel=1
pkgdesc="Generate reports on memory usage."
arch=(any)
url="http://www.selenic.com/smem/"
license=("GPL")
depends=("python2")
makedepends=("mercurial")
optdepends=("python-matplotlib: for chart generation")
provides=("smem")
conflicts=("smem")

_hgroot="http://selenic.com/repo"
_hgrepo="smem"

build() {
	cd ${srcdir}
	msg "Downloading source from ${_hgroot}"

	if [ -d smem ] ; then
		cd smem
		hg pull -q "${_hgroot}/${_hgrepo}"
	else
		hg clone -q "${_hgroot}/${_hgrepo}"
		cd smem
	fi

	msg "Fixing smem python interpreter"
	sed -i "1s/python/python2/" ${srcdir}/${_hgrepo}/smem
	msg "Compiling smemcap"
	gcc -O2 ${srcdir}/${_hgrepo}/smemcap.c -o ${srcdir}/${_hgrepo}/smemcap
}

package() {
	install -D -m 755 ${srcdir}/${_hgrepo}/smem ${pkgdir}/usr/bin/smem
	install -D -m 755 ${srcdir}/${_hgrepo}/smemcap ${pkgdir}/usr/bin/smemcap
	install -D -m 644 ${srcdir}/${_hgrepo}/smem.8 ${pkgdir}/usr/share/man/man8/smem.8
}

