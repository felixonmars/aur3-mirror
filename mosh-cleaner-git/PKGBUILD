# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='mosh-cleaner-git'
pkgdesc='Cleans up stale Mosh shell sessions'
pkgver=r2.1c2f534
pkgrel=2
depends=('glibc')
arch=('x86_64' 'i686' 'arm')
url='http://git.zx2c4.com/mosh-cleaner/about/'
license=('custom')

_pkgname=${pkgname%-git}
source=("${_pkgname}::git://git.zx2c4.com/${_pkgname}")
sha512sums=('SKIP')

pkgver () {
	cd "${_pkgname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${_pkgname}"
	make PREFIX=/usr
}

package () {
	cd "${_pkgname}"
	install -Dm755 clean-mosh "${pkgdir}/usr/bin/clean-mosh"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<-EOF
	There is no license statement at the website for this program.
	Hence, it is assumed to be in public domain until stated otherwise
	by its author at ${url}
	EOF
}

