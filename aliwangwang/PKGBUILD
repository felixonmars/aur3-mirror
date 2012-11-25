# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=aliwangwang
pkgver=1.00
pkgrel=1
pkgdesc="AliWangWang for Linux"
arch=('i686' 'x86_64')
url="http://www.taobao.com/wangwang"
license=('custom')
depends=('qt' 'qtwebkit')
if [ "$CARCH" = "i686" ]; then
    source=("http://ge.tt/api/1/files/8sPpGIA/1/blob?download")
    md5sums=('8da2c5d2cfa9e37a0d681a93f9bab53b')
elif [ "$CARCH" = "x86_64" ]; then
    source=("http://ge.tt/api/1/files/8sPpGIA/0/blob?download")
    md5sums=('06e1c294ca58d713d59e7a1d3f8d39a2')
fi

package() {
    cd $pkgdir
    tar xf $srcdir/data.tar.gz
}
