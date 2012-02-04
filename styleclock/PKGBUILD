# PKGBUILD written by 3ED

pkgname=styleclock
pkgver=0.5.1
pkgrel=1
depends=('kdebase' 'kdelibs>=3.4.0')
pkgdesc="StyleClock is a better-looking replacement for the regular KDE clock. It is easily and flexibly themable and it comes with a built in alarm clock and countdown timer."
source=(http://fred.hexbox.de/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://fred.hexbox.de/styleclock/"
md5sums=('8fa2a382239e61d6ad0c2d23a70ef1cd')
build()        {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}
