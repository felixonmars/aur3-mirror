pkgname=smooth-tasks-fork
pkgver=r532.e794677f5b85
pkgrel=1

url="https://bitbucket.org/flupp/smooth-tasks-fork/overview"
pkgdesc="A fork of great KDE taskbar replacement plasmoid smooth-tasks aimed to improve on animation and layouting."
license=('GPLv2')
arch=('x86_64' 'i686')
source=('hg+https://bitbucket.org/flupp/smooth-tasks-fork#branch=kde-4.8')
md5sums=('SKIP')

depends=('kdebase-workspace>=4.8')
makedepends=('automoc4' 'cmake' 'mercurial' 'coreutils' 'perl')

build() {
		cd "$srcdir/$pkgname"

		cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
		make || return 1
}

package() {
		cd "$srcdir/$pkgname"
		make DESTDIR="${pkgdir}" install || return 1
}

# https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Mercurial
pkgver() {
		cd "$pkgname"
		printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
