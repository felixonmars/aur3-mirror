# Maintainer: dimaz-z

pkgname="xf86-input-egalax-beta"
pkgver="3.03.4510"
pkgrel=1
pkgdesc="eGalaxTouch beta driver for xorg 1.9"
url="http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm"
license=('custom:EULA')
arch=('i686' 'x86_64')
install=('xf86-input-egalax.install')

md5sums=('cb83a0e512e17799403e777b6534098b' 'a5418600f4f5a93e0adece6a79d919f3')

_architect='32'

source=("eGalaxTouch-${pkgver}-${_architect}b-k26.tar.gz::http://home.eeti.com.tw/web20/drivers/touch_driver/Linux/20100907/eGalaxTouch-${pkgver}-${_architect}b-k26.tar.gz" 'xorg_1.9.tar.xz')

makedepends=('unzip')
depends=('libpng12')
provides=("egalax")
conflicts=()
groups=('xorg-input-drivers')

build() {
    cd $srcdir
    tar xf xorg_1.9.tar.xz || return 1
   
    cd $srcdir/eGalaxTouch${_architect}

    tar -xzf eGalaxTouch.tar.gz || return 1

    cd eGalaxTouch${_architect}

    mkdir -p \
        "$pkgdir/usr/lib/xorg/modules/input" \
	"$pkgdir/etc/X11/xorg.conf.d" \
        "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/licenses/$pkgname/" || return 1

    install -D -m755 ../../egalax_drv.so $pkgdir/usr/lib/xorg/modules/input
    install -D -m755 ../../50-egalax.conf $pkgdir/etc/X11/xorg.conf.d
    install -D -m755 eGalaxTouch $pkgdir/usr/bin
    install -D -m755 TKCal/TKCal $pkgdir/usr/bin
    install -D -m644 eula.pdf $pkgdir/usr/share/licenses/$pkgname
}

