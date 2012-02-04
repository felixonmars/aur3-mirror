# Maintainer: jcerdan <jcerdan@tecob.com>
# Contributor: coolaman <coolaman@free.fr>
pkgname=shrinkta
pkgver=0.1.12
pkgrel=4
pkgdesc="small program that can back up a single DVD title to a 4.7Gb DVD disk"
arch=('i686' 'x86_64')
url="http://shrinkta.sourceforge.net/"
license=('GPL')
depends=('nautilus-cd-burner' 'libdvdread' 'gnome-doc-utils')
source=('http://downloads.sourceforge.net/sourceforge/shrinkta/shrinkta-0.1.12.tar.gz')
md5sums=('31b23dfc5d62ac5d11dd415aeb803b13')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
}
