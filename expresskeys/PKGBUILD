# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=expresskeys
pkgver=0.4.2
pkgrel=2
pkgdesc="ExpressKeys support on Wacom tablets"
arch=('i686' 'x86_64')
url="http://expresskeys.ruivo.org/"
license="GPL"
depends=('libxtst' 'libxi')
source=(http://expresskeys.ruivo.org/${pkgname}-${pkgver}.tar.gz get_device.diff event_loop.diff)
md5sums=('78e062f572e8bd9d7451bb027db01a95' '61cfef0b45a8c7e331deed67749854bb' '3977ce1da6e751c340727aec680f0c66')

build() {
    cd $startdir/src/expresskeys-$pkgver/src-$pkgname
    patch -p0 -i $startdir/src/get_device.diff
    patch -p0 -i $startdir/src/event_loop.diff
    
    cd $startdir/src/expresskeys-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
}
