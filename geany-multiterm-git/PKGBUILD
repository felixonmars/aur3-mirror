# Contributor: Maciej Ciemborowicz <pub at ciemborowicz dot pl>

pkgname=geany-multiterm-git
pkgver=20110815
pkgrel=2
pkgdesc="MultiTerm plugin for Geany editor (terminal with tabs)."
arch=('i686' 'x86_64')
url="https://github.com/codebrainz/geany-multiterm"
license=('unknown')
depends=('geany' 'gtk2>=2.0' 'vte')
makedepends=('vala' 'git')
provides=('geany-multiterm')
source=()
md5sums=()

_gitname=geany-multiterm

build() {
	cd $srcdir

	msg "Connecting to GIT..."

	if [[ -d $_gitname ]]; then
		cd $_gitname && git pull origin && cd ..
	else
		msg "Cloning GIT (from GitHub)..."
		git clone $url || return 1
	fi

	rm -rf $_gitname-build

	msg "Cloning GIT (local)..."
	git clone $_gitname $_gitname-build || return 1

	msg "Changing directory..."
	cd "$srcdir/$_gitname-build" || return 1

	msg "Configuring..."
	./autogen.sh || return 1
	./configure --prefix=/usr || return 1

	msg "Building..."
	make PREFIX=/usr sysconfdir=/ect localstatedir=/var || return 1
}

package() {
	msg "Changing directory..."
	cd "$srcdir/$_gitname-build" || return 1
	msg "Installing..."
	make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR=$pkgdir install || return 1
}
