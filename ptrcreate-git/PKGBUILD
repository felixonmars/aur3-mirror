# Maintainer: Troy Cox <troy dot cox at rackspace dot com>

pkgname=ptrcreate-git
pkgver=20130429
pkgrel=1
pkgdesc="A simple script that will create a PTR record for a Rackspace Next Generation Cloud Server."
arch=('i686' 'x86_64')
url="http://github.com/cloudnull/ptrcreate"
license=('GPL')
depends=('curl')
makedepends=('git')
provides=('ptrcreate')
conflicts=('ptrcreate')
_gitroot='https://github.com/cloudnull/ptrcreate.git'
_gitname='ptrcreate'

build() {
        cd "${srcdir}"
        msg "Connecting to GIT server...."

        if [[ -d "${_gitname}" ]]; then
		cd "${_gitname}" && git pull origin
		msg "The local files are updated."
        else
		git clone "${_gitroot}" "${_gitname}"
        fi

        msg "GIT checkout done or server timeout"
        msg "Starting make..."

	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
}
package() {
        cd "$srcdir/$_gitname-build"
	install -Dm755 ptrcreate.sh "$pkgdir/usr/bin/ptrcreate"
}

