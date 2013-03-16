# Vaultaire: Installer: Arch
# Maintainer: Kyle Treubig <kyle [at] vimofthevine [dot] com>

pkgname=vaultaire-git
pkgver=1.1
pkgrel=1
pkgdesc="Document scanning and tagging front-end built on Qt/C++"
arch=('any')
url=('http://vaultaire.vimofthevine.com')
license=('Apache')
depends=('qt5-base')
makedepends=('git' 'make')
optdepends=('sane: scanner support'
            'qt5-imageformats: additional image format support'
            'gocr: optical character recognition'
            'tesseract: optical character recognition')

_gitroot="git://github.com/vimofthevine/Vaultaire.git"
_gitname="vaultaire"

build() {
	cd $srcdir
	msg "Connecting to git server..."

	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files have been updated"
	else
		git clone --depth 1 $_gitroot $_gitname
	fi

	msg "Git checkout done or server timeout"
	msg "Building Vaultaire"

	cd $_gitname
	make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR="$pkgdir" install
}

