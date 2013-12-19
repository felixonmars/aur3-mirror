# Maintainer: Nitin Mathew <nitn_mathew2000@hotmail.com>                                                                                             
                                                                                                                                                                                                                              
pkgname=settimezone-git                                                                                                                                  
pkgver=0.1                                                                                                                                 
pkgrel=1                                                                                                                                        
pkgdesc="Application to change the timezone in Arch Linux."                                        

arch=('i686' 'x86_64')
url="https://github.com/nsmathew/SetTimeZone"
license=('GPL3')
depends=('python')
makedepends=('git')
install=$pkgname.install
source=(${pkgname}'::git://github.com/nsmathew/SetTimeZone.git' 'settimezone-git.install')
sha256sums=('SKIP' 'ee78ee83a9e52b3735e42e1a422a633303253d8dcaf998f54f53b8f4e00b1835')
pkgver() {
  cd ${srcdir}/${pkgname}
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
 msg "Nothing to build"
}

package() {
        cd ${srcdir}/
        install -D -m755 ${pkgname}/src/settimezone.py ${pkgdir}/usr/bin/settimezone || return 1
        install -D -m644 ${pkgname}/COPYING ${pkgdir}/usr/share/licenses/settimezone/COPYING
        
        install -D -m644 ${pkgname}/resources/settimezone16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/settimezone.png
        install -D -m644 ${pkgname}/resources/settimezone22x22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/settimezone.png
        install -D -m644 ${pkgname}/resources/settimezone32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/settimezone.png
        install -D -m644 ${pkgname}/resources/settimezone48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/settimezone.png
        install -D -m644 ${pkgname}/resources/settimezone.desktop ${pkgdir}/usr/share/applications/settimezone.desktop

	#Remove the downloaded source
	cd .. && rm -fr ${pkgname}
}

