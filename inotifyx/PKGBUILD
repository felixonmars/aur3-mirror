# INotifyX: Installer: Arch
# Maintainer:  Tom Vincent <http://tlvince.com/contact>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=inotifyx
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple Python binding to the Linux inotify file system event monitoring API"
arch=("i686" "x86_64")
url="http://www.alittletooquiet.net/software/inotifyx/"
license=("MIT")
depends=("python2")
options=(!emptydirs)
source=(http://launchpad.net/${pkgname}/dev/v${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
sha1sums=('e29996f6882227e390464de2185eb25fc4e0c951')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Install
	python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
