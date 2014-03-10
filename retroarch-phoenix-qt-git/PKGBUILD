#Maintainer "flying sheep" <flying-sheep@web.de>
#Contributor Themaister <maister@archlinux.us>

pkgname=retroarch-phoenix-qt-git
_gitname="RetroArch-Phoenix"
pkgver=373.cca7553
pkgrel=1
pkgdesc='Simple launcher and configuration tool for RetroArch. Qt build'
url="http://github.com/Themaister/$_gitname"
arch=('i686' 'x86_64')
license=('GPL')
provides=('retroarch-phoenix')
depends=('qt5-base' 'retroarch-git')
source=("git://github.com/Themaister/$_gitname.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/$_gitname"
	
	rm -f phoenix/qt/qt.moc
	sed -Ei "s/\tmoc /\tmoc-qt4 /" Makefile.qt
	make -f Makefile.qt || return 1
}

package() {
	cd "$srcdir/$_gitname"
	make install PREFIX=/usr DESTDIR="$pkgdir" || return 1
}

