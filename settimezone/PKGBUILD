# Maintainer: Nitin Mathew <nitn_mathew2000@hotmail.com>                                                                                             
                                                                                                                                                                                                                              
pkgname=settimezone                                                                                                                                 
pkgver=0.2.1                                                                                                                                 
pkgrel=1                                                                                                                                        
pkgdesc="To change the timezone in Arch Linux."                                        

arch=('i686' 'x86_64')
url="https://github.com/nsmathew/SetTimeZone"
license=('GPL3')
depends=('python')
makedepends=()
install=$pkgname.install
source=(https://www.dropbox.com/s/b8nzwl9ivfgmpzt/${pkgname}_v${pkgver}.tar.gz ${pkgname}.install)
sha256sums=('6df3edd71247eb015a443c261402bb503e85ee191334d1680635eabb60239e8a' 'ee78ee83a9e52b3735e42e1a422a633303253d8dcaf998f54f53b8f4e00b1835')
pkgver() {
  msg "Nothing to do"
}

build() {
 msg "Nothing to build"
}

package() {
        cd ${srcdir}/
        install -D -m755 sources/settimezone.py ${pkgdir}/usr/bin/settimezone || return 1
        install -D -m644 COPYING ${pkgdir}/usr/share/licenses/settimezone/COPYING
        
        install -D -m644 resources/settimezone16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/settimezone.png
        install -D -m644 resources/settimezone22x22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/settimezone.png
        install -D -m644 resources/settimezone32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/settimezone.png
        install -D -m644 resources/settimezone48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/settimezone.png
        install -D -m644 resources/settimezone.desktop ${pkgdir}/usr/share/applications/settimezone.desktop

	#Remove the downloaded source
	cd .. && rm -fr ${pkgname}_v${pkgver}.tar.gz
}

