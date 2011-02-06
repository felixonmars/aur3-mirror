# Contributor: Radoslaw Mejer <radmen@gmail.com>
pkgname=touchfreeze
pkgver=0.2.5
pkgrel=1
pkgdesc="TouchFreeze docks in your system tray (KDE/Gnome) and disables button click events while typing."
url="http://www.kde-apps.org/content/show.php/TouchFreeze?content=61442"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt')
source=(http://www.fit.vutbr.cz/~kombrink/personal/touchfreeze/$pkgname-$pkgver.tar.gz)
md5sums=('ea29c247566a77a1b1cc9515c012074a')

build() {
 cd $startdir/src/$pkgname-$pkgver
 qmake
 make || return 1
 
 install -Dm755 "${srcdir}/${pkgname}-${pkgver}/touchfreeze" "${pkgdir}/usr/bin/touchfreeze"

} 

