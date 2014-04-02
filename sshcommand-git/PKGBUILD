# Maintainer: Josh Klar <j@iv597.com>

pkgname=sshcommand-git
_pkgname=sshcommand
pkgver=git~20140401
pkgrel=1
pkgdesc="Turn SSH into a thin client specifically for your app"
arch=('any')
url="https://github.com/progrium/sshcommand"
license=('unknown')
depends=('openssh')
provides=('sshcommand')
confilcts=('sshcommand')
source=(git+https://github.com/progrium/sshcommand.git)
md5sums=('SKIP')

package() {
	cd "${srcdir}/${_pkgname}/"
	install -Dm755 "sshcommand" "${pkgdir}/usr/bin/sshcommand"
}

