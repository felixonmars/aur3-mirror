# Contributor: Christian Rapp <saedelaere@arcor.de>
pkgname=tv-viewer	
pkgver=0.8.1.1
pkgrel=1
pkgdesc="TV-Viewer is a frontend to watch and record tv. It supports analog tv and devices with a build-in hardware MPEG-2 encoder."
arch=('i686' 'x86_64')
url="http://tv-viewer.sourceforge.net/"
license=('GPL')
depends=('tcl>=8.5' 'tk>=8.5' 'ivtv-utils' 'mplayer' 'xdg-utils' 'glibc' 'libxdmcp' 'libxau' 'libxcb' 'libx11')
makedepends=('wget')
optdepends=('tkimg: If using tk < 8.6 this provides png support')
provides=(tv-viewer)
conflicts=(tv-viewer)
source=(http://downloads.sourceforge.net/project/tv-viewer/tv-viewer_stable_0.8.x/$pkgver/$pkgname-$pkgver.tar.gz)
#source=(http://downloads.sourceforge.net/project/tv-viewer/tv-viewer_stable_0.8.x/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('f7c39d44ba8f2fa7c58af711441fc6b4') #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	msg "Starting make..."
	chmod a+x ./configure.tcl
	./configure.tcl --prefix="$pkgdir/usr" --bintarget="/usr/share/tv-viewer" --nodepcheck --quiet
	chmod a+x ./install.tcl
	./install.tcl --quiet
}
