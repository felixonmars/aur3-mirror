pkgname=aliwangwang
pkgver=1.0rc
_realver=1.00-00
pkgrel=1
arch=(i686 x86_64)
pkgdesc="AliWangWang for Linux"
url="http://www.taobao.com/wangwang"
if [ "$CARCH" = "i686" ]; then
    _arch=i386
    source=("http://64.120.245.17/repo/bin/${pkgname}_${_realver}_${_arch}.deb")
    md5sums=('8da2c5d2cfa9e37a0d681a93f9bab53b')
elif [ "$CARCH" = "x86_64" ]; then
    _arch=amd64
    source=("http://64.120.245.17/repo/bin/${pkgname}_${_realver}_${_arch}.deb")
    md5sums=('06e1c294ca58d713d59e7a1d3f8d39a2')
fi

license=('GPL')
depends=('qt')


build() {
    msg2 "Extracting files..."
    cd "$srcdir"
    ar x ${pkgname}_${_realver}_${_arch}.deb
    tar xf data.tar.gz -C $pkgdir
}
