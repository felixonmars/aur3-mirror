# Contributor: Michael Fellinger <m.fellinger@gmail.com>
#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=vee
pkgver=43
pkgrel=3
pkgdesc='A command line blog tool that provides an interactive and batch interface'
arch=(i686 x86_64)
url='http://www.0x743.com/vee/'
license='MIT'
depends=('sh')
makedepends=('subversion')
source=("LICENSE")
md5sums=('6000541100f43dfe467c59dd21cc2751')

_svntrunk="http://${pkgname}.googlecode.com/svn/trunk"
_svnmod=${pkgname}

build() {
	cd ${srcdir}/
	svn co $_svntrunk $_svnmod
 	cd $_svnmod
}
package() {
	cd ${srcdir}/vee
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  
}

