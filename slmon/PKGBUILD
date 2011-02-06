# Original PKGBUILD and maintainer: Florian Joncour aka Diablo150
#Note: you can compile LibGTop without GNOME support (--without-gnome).

pkgname=slmon
pkgver=0.5.13
pkgrel=2
pkgdesc="SLmon is a tool for monitoring system's performance. It displays results using nice and (hopefully) readable text-based UI."
arch=(i686 x86_64)
url="http://slmon.sourceforge.net/"
license=('gpl')
depends=('pkgconfig' 'glibc' 'glib2' 'gcc-libs' 'slang' 'libgtop')
source=(http://downloads.sourceforge.net/slmon/slmon-${pkgver}.tar.gz)
md5sums=('9907c53e26b8dfb5d33af6da32ed89e3')

build()
{
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr
    #Comment a free() function call, it going to crash the software
    #for more information: http://patch-tracking.debian.net/patch/misc/view/slmon/0.5.13-2.2/rc.c
    sed -e 's/free(home);/\/\/free(home);/' < rc.c > rc.c.tmp
    mv rc.c.tmp rc.c
    make || return 1
    make prefix=$startdir/pkg/usr install  
}
