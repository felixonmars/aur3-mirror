# Maintainer: Justin Dray <justin@dray.be>

pkgname=graphite-influxdb-git
pkgver=0.4.r90.70093fd
pkgrel=1
pkgdesc="An influxdb (0.8-rc5 or higher) backend for Graphite-web (source or 0.10.x) or graphite-api."
arch=('any')
depends=('python' 'python-influxdb')
makedepends=('python-setuptools')
optdepends=('graphite-web' 'graphite-api')
provides="graphite-influxdb"
conflicts="graphite-influxdb"
url="https://github.com/vimeo/graphite-influxdb"
license=('Apache')
options=(!emptydirs)
source=("git+https://github.com/vimeo/graphite-influxdb.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%%-git}"
	printf "%s.r%s.%s" "$(grep version setup.py | grep -oE '[0-9\.]+')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%%-git}"

	msg 'Building...'
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%%-git}"

	msg 'Installing...'
	python setup.py install --root="$pkgdir" --optimize=1
}
