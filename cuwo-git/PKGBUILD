# Maintainer: Lee Watson <aur@revthefox.co.uk>

pkgname=cuwo-git
pkgver=r444.a9c5901
pkgrel=1
pkgdesc="cuwo is an open server implementation, written in Python and C++, for Cube World."
license=('GPL3')
url="http://cuwo.org"
source=("$pkgname"::'git+https://github.com/matpow2/cuwo.git')
md5sums=('SKIP')
arch=('any')
depends=('cython')
makedepends=('git')
options=('!strip' 'staticlibs' 'libtool')
install=cuwo.install
backup=('srv/cuwo/config/anticheat.py' 'srv/cuwo/config/base.py' 'srv/cuwo/config/master.py' 'srv/cuwo/config/irc.py')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${pkgname}
	python setup.py build_ext --inplace
	touch ./data/data1.db
	touch ./data/data4.db
}

package() {
	mkdir -p ${pkgdir}/srv/
	cp -r "${srcdir}/${pkgname}" "${pkgdir}/srv/"
	mv ${pkgdir}/srv/${pkgname} ${pkgdir}/srv/cuwo
}