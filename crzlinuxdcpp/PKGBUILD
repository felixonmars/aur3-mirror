#Maintainer: Mamut Ghiunhan <venerix@blug.ro>

pkgname=crzlinuxdcpp
pkgver=0.75
_pkgver=Beta.1a
pkgrel=1
pkgdesc="DC++ client with segmented downloading. Similar to ApexDC++ or StrongDC++ from Windows."
arch=('i686' 'x86_64')
url="http://www.crzdc.net"
license=('GPL2')
depends=('gtk2' 'libglade' 'bzip2')
makedepends=('scons' 'boost')
source=(http://www.crzdc.net/CrZLinuxDCpp-$pkgver-$_pkgver.tar.bz2 SConstruct.patch)
md5sums=('96ab25f44de13d2f6bd682801e6de161'
         '0a6e28b04b385e50f58f7267e4032f64')


build(){
    cd $srcdir
    patch -Np0 -i SConstruct.patch
    cd $srcdir/CrZLinuxDCpp-$pkgver-$_pkgver
    scons PREFIX="/usr" RELEASE="yes" || return 1
    scons FAKE_ROOT="$pkgdir" install || return 1
    # Fixing Ugly colors
    rm -rf $pkgdir/usr/share/CrZDC/glade/resources.rc
}
