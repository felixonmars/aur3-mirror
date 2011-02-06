# Contributor:  Zap <ghv@netsons.org>

pkgname=gsnapshot
pkgver=1.0
pkgrel=3
pkgdesc="A simple screenshot utility, lets you capture entire screen or just a region. Also provides gdisplay, an image viewer"
arch=('i686' 'x86_64')
depends=('gtk2' 'libsm')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/gould/$pkgname-$pkgver.tar.gz)
url="http://www.softcraft.org/gsnapshot/"
md5sums=('ef609075546f38e7a14f6ca59f8187df')

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir" install
}
