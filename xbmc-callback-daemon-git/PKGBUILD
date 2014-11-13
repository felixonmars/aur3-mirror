# Maintainer: Richard Kemp <richardtkemp@gmail.com>

pkgname=xbmc-callback-daemon-git
_pkgname=xbmc-callback-daemon
pkgver=v0.4.2
pkgrel=1
pkgdesc="A small daemon that reads notifications from XBMC via the JSON-RPC socket, and performs custom actions based on those notifications."
arch=('i686' 'x86_64')
_github="github.com/pdf/xbmc-callback-daemon"
url="https://${_github}"
license=('MIT' 'custom')
makedepends=('go' 'git')
depends=('glibc')
optdepends=('xbmc>=12: Prerequisite for this to do anything')
install=${pkgname}.install
source=('xbmc-callback-daemon::git://github.com/pdf/xbmc-callback-daemon.git')
md5sums=('SKIP')



pkgver() {
	cd "$_pkgname"
	git describe --tags
}

build() {
	cd "${_pkgname}"
	export GOPATH="${srcdir}/${_pkgname}"
	go get ${_github}
}

package() {
	install -Dm 755\
		"${_pkgname}/bin/${_pkgname}"\
		"${pkgdir}/usr/bin/${pkgname}"

	install -Dm 644\
		"${_pkgname}/src/${_github}/LICENSE"\
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm 644\
		"${_pkgname}/src/${_github}/contrib/config.example.json"\
		"${pkgdir}/usr/share/${pkgname}/config.example.json"
}
