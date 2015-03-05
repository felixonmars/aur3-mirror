# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
_pkgname=c
pkgname=$_pkgname-git
pkgver=r49.cb91797
pkgrel=1
pkgdesc="Compile and execute C \"scripts\" in one go!"
url="https://github.com/ryanmjacobs/$_pkgname"
arch=(any)
license=('MIT')
depends=()
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D "${srcdir}/$_pkgname/c" $pkgdir/usr/bin/c
}
