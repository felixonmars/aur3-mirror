# Contributor: limser<lishengming.zju@gmail.com>
pkgname=airweibo
_pkgfallname="AIRweibo(1.14.2).air"
pkgver=1.14.2
pkgrel=1
pkgdesc="A Sina Weibo client based on Adobe AIR."
arch=('i686' 'x86_64')
url="http://desktop.weibo.com/air.php"
license=(custom)
if [[ "${CARCH}" == 'x86_64' ]];then
  depends=('adobe-air' 'lib32-curl')
else
  depends=('adobe-air' 'curl')
fi

source=("http://airweibo-install.stor.sinaapp.com/$_pkgfallname"
		'airweibo.desktop'
		'airweibo'
		'icon.png')

md5sums=('71c3ce2b4d374094f2df2c91fa2de490'
         'b396179105ec568ba06421dc6a471df0'
         '8bb804dc6dc46ee45eb710e1955373e4'
         '1976615c279569f20ae51a4865383064')

noextract=("$_pkgfallname")
package()
{
  cd ${srcdir}
  install -d ${pkgdir}/{usr/share/applications,usr/bin,opt/${pkgname}}

  install -Dm644 "$_pkgfallname" ${pkgdir}/opt/${pkgname}/airweibo.air
  install -Dm644 icon.png ${pkgdir}/opt/${pkgname}/

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/_AIRFILE/airweibo.air/" ${pkgdir}/usr/bin/${pkgname}
}