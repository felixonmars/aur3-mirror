# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=python-xmms2-mlib-adapter-git
pkgver=1
pkgrel=1
pkgdesc="Export and import xmms2 playlists and song statistics to plaintext."
arch=('i686' 'x86_64')
url="https://github.com/dffischer/xmms2-mlib-adapter"
license=('GPL3')
depends=('python' 'python-progressbar' 'xmms2<0.9DrParnassus')
makedepends=('waf' 'python-argparse-manpager')
source=("$pkgname::git://github.com/dffischer/xmms2-mlib-adapter.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	waf --prefix=/usr configure build
}

package() {
	cd "$srcdir/$pkgname"
	waf install --destdir="$pkgdir/"
}
