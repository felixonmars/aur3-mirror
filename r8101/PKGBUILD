# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Geoffroy Carrier <gcarrier@aur.archlinux.org>
# Contributor: benjarobin

pkgname=r8101
pkgver=1.025.00
pkgrel=1
pkgdesc="r8101 realtek lan drivers"
#http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PNid=7&PFid=7&Level=5&Conn=4&DownTypeID=3&GetDown=false
url="http://realtek.com.tw"
license=('GPL')
arch=('i686' 'x86_64')
source=("ftp://WebUser:Lc9FuH5r@208.70.202.219/cn/nic/r8101-1.025.00.tar.bz2")
install=r8101.install
depends=('linux-headers')

	_kernver=`uname -r`
#_kernver=extramodules-3.6-ARCH

md5sums=('dd9c779a36252ced4735591207cb4ebe')

build()
{
    cd "$srcdir"/$pkgname-$pkgver
    chmod +x src/
    #make modules
    make
    mkdir -p "$pkgdir/usr/lib/modules/$_kernver/"
    gzip -c "src/r8101.ko" > "$pkgdir/usr/lib/modules/$_kernver/r8101.ko.gz"
}
