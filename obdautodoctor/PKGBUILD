# obdautodoctor: Installer: Arch
#Maintainer: Marko Paasila <marko at paasila dot net>
pkgname=obdautodoctor
pkgver=1.8.4
pkgrel=2
pkgdesc="Advanced OBD2 Software from Creosys"
arch=('any')
url="http://www.obdautodoctor.com/desktop/"
install=obdautodoctor.install
license=('custom')
depends=(qt4 bluez bluez-libs glibc)
source_x86_64=(http://www.obdautodoctor.com/downloadfile.php?file=obd-auto-doctor_${pkgver}_amd64.tar.gz)
source_x86=(http://www.obdautodoctor.com/downloadfile.php?file=obd-auto-doctor_${pkgver}_i386.tar.gz)
md5sums_x86_64=('017b08892edf54638385b5e96592d828')
md5sums_x86=('dfeb37a49dfb85c2c0c278994eadc56a')

build() {
	return 0
}

package() {
	  cd $srcdir/$pkgname

	  #application itself
	  install -d $pkgdir/usr/bin
	  install -m755 $pkgname $pkgdir/usr/bin/

	  #application.desktop
	  install -d $pkgdir/usr/share/applications
	  install -m 644 $pkgname.desktop $pkgdir/usr/share/applications/

	  #The icon file
	  install -d $pkgdir/usr/share/pixmaps
	  install -m 644 $pkgname.png $pkgdir/usr/share/pixmaps

	  #The license file
	  install -d $pkgdir/usr/share/licenses/$pkgname
	  install -m 644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
