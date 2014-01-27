# Maintainer: defendor <defendor@riseup.net>
pkgname=qmaketorrent-git
pkgrel=1
pkgver=0.44.1.1.2
pkgdesc="An advanced torrent creator with batch capability, git version."
arch=('i686' 'x86_64')
url="https://github.com/kz26/qMakeTorrent"
license=('GPL')
makedepends=('git' 'boost')
depends=('qt4' 'libtorrent-rasterbar')
provides=(qmaketorrent)
conflicts=(qmaketorrent)
source=(qmaketorrent::git+https://github.com/kz26/qMakeTorrent.git)
md5sums=(SKIP) #generate with 'makepkg -g'

_gitname=qmaketorrent

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
	qmake-qt4
	make
}

!check() {
	cd "$srcdir/$_gitname"
	make -k check
}

package() {
	cd "$srcdir/$_gitname"
	cat LICENSE
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"
	mv qMakeTorrent qmaketorrent
	echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=qMakeTorrent\nGenericName=Batch Torrent Creator\nType=Application\nCategories=Network;FileTransfer;P2P;\nTerminal=false\nExec=/usr/bin/qmaketorrent" > qmaketorrent.desktop
	cp qmaketorrent "${pkgdir}/usr/bin"
	cp qmaketorrent.desktop "${pkgdir}/usr/share/applications"
}
