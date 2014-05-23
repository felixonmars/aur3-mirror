pkgname='groover-git'
pkgver=0.0.r0.g26d4d39
pkgrel=1
pkgdesc='Simple remote for the Groove Basin music player daemon.'
license='MIT'
url='https://github.com/aperezdc/groover'
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')
arch=('i686' 'x86_64' 'arm')
depends=('webkitgtk2')
options=('strip' 'zipman')
provides=('groover')
conflicts=('groover')

pkgver () {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr 
}

package () {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
}
