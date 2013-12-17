# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="pcw"
pkgver=0.3
pkgrel=2
pkgdesc="pcw uses inotify to monitor a directory tree (created by ii) and \
	open terminals running cw with the in and out files for each channel."
url="https://bitbucket.org/emg/pcw"
license=("MIT")
arch=("i686" "x86_64")
depends=("ii" "srw")
makedepends=()
source=("https://bitbucket.org/emg/pcw/get/${pkgver}.tar.gz")
md5sums=('a988e956d1fc20e22b2f623aadb15794')

build() {
	cd "emg-${pkgname}-dcc34d1991c6"
	make
}

package() {
	cd "emg-${pkgname}-dcc34d1991c6"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	install -D -m644 README \
		"${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: set noet ff=unix:
