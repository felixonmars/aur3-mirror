# Maintainer: Laszlo Papp <djszapi2 @ gmail at com>
pkgname=gtkeyboard
pkgver=1.1.7
pkgrel=2
pkgdesc="Full keyboard including all punctuation and symbols"
arch=('i686')
depends=('perl' 'gtk' 'libxmu')
url="http://www.gnu.org/software/gtkeyboard/"
license=('GPL')
source=(http://chello.linux.tucows.com/files/$pkgname-$pkgver.tar.gz
        irxevent.patch)
md5sums=('6bb59d684109c9054c23cf21f5c10668'
         '8cc861deb12280541a83534759259d72')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=$pkgdir/usr --mandir=$pkgdir/usr/share
    patch -d ./include < $srcdir/irxevent.patch
    # sed -i 's/PREFIX     = \/usr\//PREFIX     = ..\/..\/pkg\/usr/g' Makefile
    make || return 1
    make install || return 1
    mv -f $pkgdir/usr/man $pkgdir/usr/share/
}
