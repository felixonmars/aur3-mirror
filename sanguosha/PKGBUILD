# Maintainer: Fisher Duan <steamedfish@njuopen.com>
# Maintainer: Vehicle Lee <imxifs@gmail.com>
# Maintainer: Jimmy Xu <me@jimmyxu.org>
pkgname=sanguosha
pkgver=3.6.8
pkgrel=1
pkgdesc="A Chinese board game, online version"
arch=('i686' 'x86_64')
url="http://www.sanguosha.com/"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
noextract=(SanGuoSha.air)
source=(SanGuoSha.air::http://web.sanguosha.com/2/air/SanGuoSha_$pkgver.air
        sanguosha
        sanguosha.desktop)

package()
{
	cd ${srcdir}
	install -d ${pkgdir}/{usr/{bin,share/{applications,icons/${pkgname}}},opt/${pkgname}} 

	unzip SanGuoSha.air -d ${srcdir}/

	install -Dm644 assets/icon/SGS32.png ${pkgdir}/usr/share/icons/${pkgname}/
	install -Dm644 SanGuoSha.air ${pkgdir}/opt/${pkgname}/

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('a15c76a164234c244ea514ecc27598aa'
         'caadd6f792483aaf98202bb4d51481bb'
         '5703da141c6edac3e4311f5023db3832')
