# Maintainer: hcjl <hcjlnx {at} gmail {dot} com>

pkgname=usenext
pkgver=5.62
pkgrel=1
pkgdesc="UseNeXT Client for Linux"
url="http://www.usenext.de"
license=('unknown')
depends=('mono' 'unrar' 'gtk-sharp-2')
makedepends=('rpmextract' 'sed')
arch=('any')
source=('http://update.tangysoft.net/download/usenext.rpm')
md5sums=('a1f5f27dbcc6f1d076703b043eab64fe')

build() {
    true
}

package() {
    cd "${startdir}/pkg"
    rpmextract.sh $startdir/src/usenext.rpm
    cp -r "${srcdir}/usr/" "${pkgdir}"
    #sed -i 's/UseNeXTLauncher/UseNeXT/g' $pkgdir/usr/bin/usenext
    #rm $pkgdir/usr/lib/usenext/UseNeXTLauncher.exe
}
