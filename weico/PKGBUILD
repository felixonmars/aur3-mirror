# Maintainer: madoldman <madoldman@163.com
pkgname=weico
pkgver=1.54
_pkgver=20111017
pkgrel=1
pkgdesc="Sian microblog client based on Adobe Air."
arch=('i686' 'x86_64')
url="http://www.weico.com"
license=('unknown')
if [ "$CARCH" == "x86_64" ]; then
    depends=('bin32-adobe-air' 'lib32-nss')
else
    depends=('adobe-air')
fi
makedepends=('unzip')
source=(http://static.weico.s3.sinaapp.com/WeicoAir.zip weico.desktop weico)
md5sums=('8c207aca743bb596e532088292e161d9'
         '73e3f8b4145c57b13da6d10508b1f4ca'
         'b6a3d02ca43721ed9757f7103c4e4a68')

package()
{
	cd ${srcdir}
	unzip weicoair.air
	install -d ${pkgdir}/{usr/{bin,share/{applications,icons/${pkgname}}},opt/${pkgname}} 

	install -Dm644 icon/weico128.png ${pkgdir}/usr/share/icons/${pkgname}/
	install -Dm644 weicoair.air ${pkgdir}/opt/${pkgname}/

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
