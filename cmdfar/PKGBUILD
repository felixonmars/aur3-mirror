# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=cmdfar
pkgver=1.01
pkgrel=1
pkgdesc="Use any FAR FS plugin from a command line"
arch=(i686 x86_64)
url="http://www.kakeeware.com/i_cmdfar.php"
license=('custom:freeware+sources')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=(unzip)
source=(http://www.kakeeware.com/d/cmdFAR.zip)
md5sums=('0c800199a954a06a25b821ed943cefe3')
noextract=()
options=(!strip)

build() {
  cd "$startdir"
  install -d -m755 pkg/usr/share/$pkgname
  cp -ra src/*.exe pkg/usr/share/$pkgname
  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;
}
