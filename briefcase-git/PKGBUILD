pkgname=briefcase-git
pkgver=20130404
pkgrel=1

pkgdesc='An online collaborative document editor'
arch=('any')
url='https://github.com/Briefcase/Briefcase'
license=('BSD')
depends=('python2-django' 'sqlite')
makedepends=('git')
optdepends=('nginx: HTTP server')
provides=()
conflicts=('briefcase')
options=()
install=${pkgname}.install

_gitroot='https://github.com/Briefcase/Briefcase'
_gitname='briefcase'
_gitbranch='master'

_installdir="/etc/webapps"

build() {
	cd ${srcdir}

	msg "Connecting to GIT server..."
	if [[ -d ${_gitname} ]]; then
		(cd ${_gitname} && git pull origin)
	else
		git clone ${_gitroot} ${_gitname}
	fi
	msg "GIT checkout done"

	rm -rf ${_gitname}-build
	git clone ${_gitname} ${_gitname}-build

	cd ${srcdir}/${_gitname}-build
	git checkout ${_gitbranch}
	rm -rf ./.git
}

package() {
	cd ${srcdir}/${_gitname}-build/briefcase

	mkdir -p ${pkgdir}/${_installdir}/${_gitname}
	cp -r ./ ${pkgdir}/${_installdir}/${_gitname}
}
