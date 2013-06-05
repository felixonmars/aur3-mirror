# Contributor: Olivier Mehani <olivier.mehani@nicta.com.au>
pkgname=oml2-apps-git
pkgver=2.10.0
pkgrel=1
pkgdesc="OML2 applications collection"
arch=(i686 x86_64)
url="http://omlapp.mytestbed.net/"
license=('custom:MIT-Nicta')
depends=('oml2')
optdepends=(
'collectd: for the write_oml plugin'
'gpsd: for gpslogger'
'iputils: for ping'
'libsigar: for nmetrics'
'libtrace: for trace'
'ruby: for ping'
'wpa_supplicant: for wpamon')
makedepends=('git')
install='oml2-apps.install'
source=(
)

_gitroot="git://mytestbed.net/oml-apps.git"
_gitname="oml"
_gitbranch="staging"
_builddir=${_gitname}-build

build() {
	cd "${srcdir}"
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	if [ ! -z ${_gitbranch} ]; then
		cd ${_gitname} && git checkout ${_gitbranch}
		cd ${_gitname} && git checkout master
	fi

	msg "Starting make..."

	rm -rf "${srcdir}/${_builddir}"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_builddir}"
	cd "${srcdir}/${_builddir}"
	cd "${srcdir}/${_builddir}"
	./autogen.sh
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "${srcdir}/${_builddir}"
	make DESTDIR="${pkgdir}/" install
}
md5sums=()
