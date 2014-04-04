# Maintainer: Josh Klar <j@iv597.com>

pkgname=shoreman-git
_pkgname=shoreman
pkgver=r68.5180c1c
pkgrel=1
pkgdesc="foreman in shell"
arch=('any')
url="http://hecticjeff.github.com/shoreman/"
license=('MIT')
depends=('net-tools')
provides=('shoreman')
confilcts=('shoreman')
source=(git+https://github.com/hecticjeff/shoreman.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}/"
	install -Dm755 "shoreman.sh" "${pkgdir}/usr/bin/shoreman"
}

