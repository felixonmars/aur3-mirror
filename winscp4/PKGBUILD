# Contributor: Vladimir Navrat <vn158 at seznam dot cz>
pkgname=winscp4
pkgver=4.4
pkgrel=1
pkgdesc="Free SFTP, FTP and SCP client for Wine"
arch=(i686 x86_64)
url="http://winscp.net/"
license=('GPL')
depends=(wine)
source=($pkgname $pkgname.desktop $pkgname.png http://downloads.sourceforge.net/project/winscp/WinSCP/${pkgver}/${pkgname%?}${pkgver//./}0.zip)
md5sums=('5169ce490bd09aa7e83a075f93d41168'
         'f2e9ba95771d26aa60db5cd06295caaa'
         'f4d0f48fc2739f4844bdcc49ab1ce4f0'
         '88c1236908b1e34c9fc655daacd8b64f')
sha1sums=('74ec6f3b563854b97afa260ba973a195d0c0fbdb'
          '67838c0391c853621945314a33be4e752847ba7f'
          '72b65f619bc349c581db7d061c4471e9b7621dca'
          'b2414e96408d0212f3ad9a8383b0c19bdc17a11c')
sha256sums=('f880f7e279be076028081c619fe418cb80f01d1324d8e6aae46fa6420cee0117'
            '1f9c20da1fdd59719dd75c0c66c2df1eb287d5d64e4f0af0cc47d8324d7ea107'
            '3cb0908420a8d8049304592a18876d275316e74331133436717d74941f8c4cdb'
            'e0f21713dfc25938b3a4bb5261007b874352c62024ffa2fcc7c87037f56fbb1a')
noextract=()
options=(!strip)

package () {
  cd "$startdir"

  install -d -m755 ${pkgdir}/usr/share/$pkgname
  install -m644 $srcdir/WinSCP.exe ${pkgdir}/usr/share/$pkgname/$pkgname.exe

  install -d -m755 ${pkgdir}/usr/share/applications
  install -m644 $pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop

  install -d -m755 ${pkgdir}/usr/share/pixmaps
  install -m644 $pkgname.png ${pkgdir}/usr/share/pixmaps/$pkgname.png 

  install -d -m755 ${pkgdir}/usr/bin
  install -m755 $pkgname ${pkgdir}/usr/bin 
}
