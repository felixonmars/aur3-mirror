# Maintainer: Vadim Ushakov <igeekless@gmail.com>

pkgname=gpicview-gtk2-git
pkgver=20120806
pkgrel=1
pkgdesc="lightweight image viewer"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde')
depends=('gtk2' 'desktop-file-utils')
install=gpicview.install
makedepends=('pkgconfig' 'intltool')
optdepends=('librsvg: For SVG support')
provides=('gpicview')
conflicts=('gpicview' 'gpicview-gtk3-git')

_gitroot=git://lxde.git.sourceforge.net/gitroot/lxde/gpicview
_gitname=gpicview

build() {
        cd "$srcdir"

        msg "Connecting to $_gitroot..."
        if [[ -d $_gitname ]]; then
                cd $_gitname && git pull origin && cd ..
                msg2 "Local files updated"
        else
                git clone $_gitroot
                msg2 "Git checkout done"
        fi

        rm -rf $_gitname-build
        git clone $_gitname $_gitname-build
        cd $_gitname-build

        msg "Starting make..."
        ./autogen.sh
        ./configure --prefix=/usr --sysconfdir=/etc --disable-gtk3
        make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
