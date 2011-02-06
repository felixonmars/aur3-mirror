# Maintainer: dimaz-z

pkgname="xf86-input-egalax-xorg18"
pkgver="3.01.4001"
pkgrel=1
pkgdesc="eGalaxTouch beta driver for xorg 1.8."
url="http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm"
license=('custom:EULA')
arch=('i686' 'x86_64')
install=('xf86-input-egalax.install')

md5sums=('4c98a50a7d352b41f63c2f2f30cedaef' '3e99c65364fd8ab6c5353d12df8f1345')

_architect='32'
[ "$CARCH" = "x86_64" ] && _architect='64'
[ "$CARCH" = "x86_64" ] && md5sums[0]='3cdf009a39e498c4867f97cc62ace0ef'

source=("eGalaxTouch-${pkgver}-${_architect}b-k26.tar.gz::http://home.eeti.com.tw/web20/drivers/touch_driver/Linux/20100413/eGalaxTouch-${pkgver}-${_architect}b-k26.tar.gz" 'X180.zip')

makedepends=('unzip')
depends=('libpng12')
provides=("egalax")
conflicts=()
groups=('xorg-input-drivers')

build() {
    cd $srcdir/eGalaxTouch${_architect}

    tar -xzf eGalaxTouch.tar.gz || return 1

    cd eGalaxTouch${_architect}

    mkdir -p \
        "$pkgdir/usr/lib/xorg/modules/input" \
        "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/licenses/$pkgname/" || return 1

    install -D -m755 ../../X180/${_architect}b/egalax_drv.so $pkgdir/usr/lib/xorg/modules/input
    install -D -m755 eGalaxTouch $pkgdir/usr/bin
    install -D -m755 TKCal/TKCal $pkgdir/usr/bin
    install -D -m644 eula.pdf $pkgdir/usr/share/licenses/$pkgname
}

