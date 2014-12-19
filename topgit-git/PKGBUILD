# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>
# Contributor: Matt McDonald <metzen@gmail.com>

pkgname=topgit-git
_pkgname=topgit
pkgver=0.9.r0.gf2815f4
pkgrel=1
pkgdesc="A different patch queue manager"
url="http://repo.or.cz/w/topgit.git"
license=("GPL")
arch=('i686' 'x86_64')
depends=('git')
optdepends=('emacs-magit-git: emacs front-end to git and topgit')
conflicts=('topgit')
provides=('topgit')
source=('git://repo.or.cz/topgit.git')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --always --long | sed -E 's/^topgit-//;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
	cd "${_pkgname}"

	make prefix=/usr
}

package() {
	cd "${_pkgname}"

	make prefix=/usr DESTDIR="$pkgdir" install || return 1

	mkdir -p "$pkgdir/etc/bash_completion.d"
	install -m 644 contrib/tg-completion.bash "$pkgdir/etc/bash_completion.d/topgit" || return 1
}
