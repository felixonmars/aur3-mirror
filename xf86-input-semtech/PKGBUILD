pkgname=xf86-input-semtech
pkgver=0.52
pkgrel=1
pkgdesc="X.org Semtech Itronix TouchScreen input driver"
arch=(i686 x86_64)
license=('gpl')
url="http://khetzal.info/ix260/"
depends=('xorg-server')
options=('!libtool')
source=("http://dl.dropbox.com/u/23862285/semtech-module-${pkgver}.tar.gz" "10-semtech.rules" "readme")
md5sums=('cdff46b4c58eb0072117bf6b3c5fcde8'
         '31765583b43ef28025521d5f2f9663e1'
         '5a4c5dabcb99e9545e4927f3b6374bcd')
install=semtech.install


build() {
 cd "${srcdir}/semtech-module-${pkgver}"
 make modules
}

package() {
 cd "${srcdir}/semtech-module-${pkgver}"

 #make INSTALL_MOD_PATH="$pkgdir/" modules_install
 mkdir -p $pkgdir/lib/modules/`uname -r`/kernel/drivers/input/touchscreen/
 cp semtech.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/input/touchscreen/

 cd ${srcdir}
 mkdir -p $pkgdir/etc/udev/rules.d
 cp 10-semtech.rules $pkgdir/etc/udev/rules.d
}
