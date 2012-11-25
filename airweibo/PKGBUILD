# Coutributer: limser <echo bGltc2VyQHFxLmNvbQo=|base64 -d>

pkgname=airweibo
pkgver=2.3.1
_fullname="AIRweibo($pkgver).air"
pkgrel=1
pkgdesc="A Sina Weibo client based on Adobe AIR."
arch=('i686' 'x86_64')
url="http://desktop.weibo.com/air.php"
license=(custom)
if [[ "${CARCH}" == 'x86_64' ]];then
  depends=('adobe-air' 'lib32-curl' 'lib32-libxt' 'lib32-libxtst')
else
  depends=('adobe-air' 'curl' 'libxt' 'libxtst')
fi

source=("http://airweibo-install.stor.sinaapp.com/$_fullname"
		'airweibo.desktop'
		'airweibo'
		'icon.png')
md5sums=('b7f6f8a1e1f70be75a6929168e5db92b'
         'b396179105ec568ba06421dc6a471df0'
         '8bb804dc6dc46ee45eb710e1955373e4'
         '1976615c279569f20ae51a4865383064')

noextract=("$_fullname")
package()
{
  cd ${srcdir}
  install -d ${pkgdir}/{usr/share/applications,usr/bin,opt/${pkgname}}

  install -Dm644 "$_fullname" ${pkgdir}/opt/${pkgname}/airweibo.air
  install -Dm644 icon.png ${pkgdir}/opt/${pkgname}/

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/_AIRFILE/airweibo.air/" ${pkgdir}/usr/bin/${pkgname}
}
