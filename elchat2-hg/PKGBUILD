# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>

_name=elchat2
pkgname=${_name}-hg
pkgver=20110527
pkgrel=1
pkgdesc="A lightweight chat-only Eternal Lands client"
arch=('i686')
url="https://bitbucket.org/freeone3000/elchat2"
license=('custom')
depends=()
makedepends=('mercurial' 'boost' 'cmake')
source=('elchat2.sh')
md5sums=('7d7fe1259847bb1a6ba9c049589f5a66')

_hgroot=$url

build() {
	cd $srcdir
	msg "Connecting to hg server..."
	if [[ -d "$_name/.hg" ]]; then
		msg "pull"
		( cd $_name && hg pull -u )
	else
		msg "clone"
		hg clone $_hgroot
	fi
	sed -i 's_SHARED_STATIC_' $_name/ELNetworkLib/CMakeLists.txt
	if [[ -d cmake_out ]]; then
		rm -r cmake_out
	fi
	mkdir cmake_out && cd cmake_out
	cmake ../$_name
	make || return 1
	install -D -m755 ELChat2/ELChat2 "$pkgdir/usr/share/$_name/ELChat2"
	install -D -m644 "$srcdir/$_name/ELChat2/servers.lst" "$pkgdir/usr/share/$_name/servers.lst"
	install -D -m755 "$srcdir/elchat2.sh" "$pkgdir/usr/bin/$_name"
}
