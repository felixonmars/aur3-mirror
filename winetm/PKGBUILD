#Maintainer: phoenixlzx <phoenixlzx [at] archlinuxcn.org>

pkgname=winetm
pkgver=20120719
pkgrel=1
pkgdesc='wine version of TM client,made by Longene Team'
arch=('i686' 'x86_64')
url='http://www.longene.org'
license=('Other')
source=("http://www.longene.org/download/WineTM2009-20120719-Longene.deb")
md5sums=('5a948f1c61b476d78ee88f041730f9d0')
depends=('libnotify')

package()
{
	tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
	chmod -R 755 ${pkgdir}/opt/longene
	cp ${pkgdir}/opt/longene/tm2009/tm2009-test.desktop ${pkgdir}/usr/share/applications/tm2009-test.desktop
}
