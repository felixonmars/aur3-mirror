# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: Vadim Ushakov <igeekless@gmail.com>

_gitname=gpicview
pkgname="$_gitname"-gtk3-git
pkgver=20130101
pkgrel=1
pkgdesc="lightweight image viewer"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde')
depends=('gtk3' 'desktop-file-utils')
install=gpicview.install
makedepends=('pkgconfig' 'intltool')
optdepends=('librsvg: For SVG support')
provides=('gpicview')
conflicts=('gpicview' 'gpicview-gtk2-git')
source=(git://lxde.git.sourceforge.net/gitroot/lxde/gpicview)
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/$_gitname
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
        cd $srcdir/$_gitname
        
		sed -i -e 's/1.12/1.14/g' autogen.sh
        
        ./autogen.sh
        ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk3
        make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR="$pkgdir" install
}
