# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=xkb-lng
pkgver=20090706
pkgrel=1
pkgdesc="A linguist's xkb keyboard"
url='http://github.com/caminoix/conf/tree/master/kbd'
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git')
optdepends=()
provides=('xkb-lng')
conflicts=()
replaces=()
source=()
md5sums=()
install=$pkgname.install

_gitname='conf'
_gitroot='git://github.com/caminoix/conf.git'

build() {
	msg "Connecting to Git server..."
	if [ -d "$srcdir/$_gitname" ]; then
		cd "$srcdir/$_gitname" && git pull origin || return 1
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Git checkout done or server timeout"

	install -D -m644 "${srcdir}/${_gitname}/kbd/$pkgname" "${pkgdir}/usr/share/X11/xkb/symbols/lng"
}
