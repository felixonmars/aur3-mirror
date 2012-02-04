# Maintainer: Bhoppi Chaw <bhoppi hotmail com>

pkgname=bin32-neroaac
pkgver=1.5.1
pkgrel=2
pkgdesc='Nero high fidelity MPEG-4 and 3GPP audio codec'
arch=('x86_64')
url='http://www.nero.com/enu/technologies-aac-codec.html'
license=('custom')
depends=('gcc-libs-multilib')
source=("http://ftp6.nero.com/tools/NeroAACCodec-$pkgver.zip")

build()
{
    cd $srcdir
    install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
    cd linux
    install -D -m755 neroAacDec $pkgdir/usr/bin/neroAacDec
    install -D -m755 neroAacEnc $pkgdir/usr/bin/neroAacEnc
    install -D -m755 neroAacTag $pkgdir/usr/bin/neroAacTag
}
md5sums=('150ead71fb7838c52a31098c85b91211')
