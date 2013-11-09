# Maintainer: INVENT <invent@0x0a.net>

_pkgname=fontconfig-infinality
pkgname=fontconfig-infinality-git
pkgver=101.91eb8e6
pkgrel=1
pkgdesc="Fontconfig files for use with freetype2-infinality. GIT version."
arch=(any)
license=('GPL')
url="https://github.com/Infinality/fontconfig-infinality"
depends=('fontconfig' 'freetype2-infinality')
makedepends=('git')
install='install.sh'
provides=('fontconfig-infinality')
conflicts=('fontconfig-infinality')
backup=(
	'etc/fonts/infinality/infinality.conf'
	'etc/fonts/conf.d/52-infinality.conf'
)

source=("git://github.com/Infinality/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

	mkdir -p "${pkgdir}/etc/fonts"/{conf.avail,conf.d,infinality} "${pkgdir}/usr/bin"
	cp -r "${_pkgname}"/{conf.avail,conf.d,infinality} "${pkgdir}/etc/fonts"
	ln -sf /etc/fonts/infinality/infctl.sh "${pkgdir}/usr/bin/infctl"
}
