pkgname=sqlite-manager
pkgver=0.8.3
pkgrel=1
pkgdesc="A very lightweight XULRunner application to manage all your sqlite databases"
arch=('x86_64' 'i686')
url="https://github.com/lazierthanthou/sqlite-manager"
license=('MPL')
depends=('xulrunner' 'gcc-libs')
source=("https://github.com/lazierthanthou/sqlite-manager/releases/download/v$pkgver/sqlitemanager-xr-$pkgver-all.zip" "$pkgname.desktop" "$pkgname.sh")
md5sums=('4a1a751026a10e927a6144eed7a61474'
         'df173e088bd2c13405691d972553eeb9'
         '56aaa0213dd5ca202f9d4c1c82c2b6ef')
noextract=("sqlitemanager-xr-$pkgver-all.zip")

package() {
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/sqlite-manager
  bsdtar -xf sqlitemanager-xr-$pkgver-all.zip -C ${pkgdir}/usr/share/sqlite-manager
  sed -i 's/MaxVersion=27.0/MaxVersion=40.0/' ${pkgdir}/usr/share/$pkgname/application.ini
  install -Dm644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  install -Dm755 ${srcdir}/$pkgname.sh ${pkgdir}/usr/bin/$pkgname.sh
}
