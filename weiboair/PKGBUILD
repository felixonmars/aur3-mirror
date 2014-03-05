# Contributor: lishengming.zju <lishengming.zju@gmail.com>
pkgname=weiboair
pkgver=149
pkgrel=2
pkgdesc="A Sina Weibo client based on Adobe AIR."
arch=('i686' 'x86_64')
url="http://sinatair.sinaapp.com/"
license=(custom)
if [[ "${CARCH}" == 'x86_64' ]];then
  depends=('adobe-air' 'lib32-curl')
else
  depends=('adobe-air' 'curl')
fi
source=('http://rm.sina.com.cn/emarket/WeiboAIR/WeiboAir149.air' 'weiboair.desktop' 'weiboair' 'icon.png')
md5sums=('031df4524ca0728593c7abc00fa766d6' '2ec1c99e7b3374622c37cf679381bbf9' '60ff36a3fb4380bd580b4b477a901553' '991982341ed620abcb6314033d84dda3')
noextract=('WeiboAir149.air')
package()
{
  cd ${srcdir}
  install -d ${pkgdir}/{usr/share/applications,usr/bin,opt/${pkgname}}

  install -Dm644 WeiboAir149.air ${pkgdir}/opt/${pkgname}/
  install -Dm644 icon.png ${pkgdir}/opt/${pkgname}/

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
