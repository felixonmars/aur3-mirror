pkgname=go-pkg-mpd-git
_goname=go-pkg-mpd
pkgver=20110809
pkgrel=1
pkgdesc="MPD API wrapper for Go (git version)"
url="https://github.com/jteeuwen/go-pkg-mpd"
license=('CC0')
depends=('go')
makedepends=('git')
options=("!strip")
arch=('i686' 'x86_64')
_gitroot="git://github.com/jteeuwen/go-pkg-mpd.git"
_gitname="go-pkg-mpd"

build() {
    cd $srcdir

    if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot
    fi

    cd $srcdir

    rm -rf $_gitname-build
    git clone $_gitname{,-build}

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd ${_gitname}-build

    source /etc/profile.d/go.sh
    gomake
}

package() {
	cd ${srcdir}/${_gitname}-build
	source /etc/profile.d/go.sh
	mkdir -p "${pkgdir}/${GOROOT}/src/pkg/${_goname}"
	# copy source files
	cp -Rv ${srcdir}/${_gitname}/* "${pkgdir}/${GOROOT}/src/pkg/${_goname}"
	# copy licence
	install -D "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	# install libraries
	cp -v ${GOROOT}/src/Make.* "${pkgdir}/${GOROOT}/src/"
	GOROOT=${pkgdir}/${GOROOT} gomake install
	rm -f ${pkgdir}/${GOROOT}/src/Make.*

}
