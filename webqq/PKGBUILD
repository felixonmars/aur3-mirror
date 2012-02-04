# Maintainer: dieyushi <zzscu@live.com>
pkgname=webqq
pkgver=1.1.30
_pkgver=20110906
pkgrel=1
pkgdesc="Instant messaging software from Tencent Inc based on Adobe Air."
arch=('i686' 'x86_64')
url="http://im.qq.com/webqq/"
license=('unknown')
if [ "$CARCH" == "x86_64" ]; then
    depends=('bin32-adobe-air' 'lib32-nss')
else
    depends=('adobe-air')
fi
makedepends=('unzip')
source=(http://dl_dir.qq.com/qqfile/web/webqq/WebQQ.air webqq webqq.desktop)
md5sums=('7aeeeefbcc2f3b4b1895b41bdbf9f4ae'
         '4eb475ae39d2a585218142d52406ef3f'
         'e4bb6a6a15d83021013b43bd6d7707e6')

package()
{
	cd ${srcdir}
	install -d ${pkgdir}/{usr/{bin,share/{applications,icons/${pkgname}}},opt/${pkgname}} 

	install -Dm644 res/webqq/128.png ${pkgdir}/usr/share/icons/${pkgname}/
	install -Dm644 WebQQ.air ${pkgdir}/opt/${pkgname}/

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
