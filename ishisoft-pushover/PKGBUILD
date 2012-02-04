# Contributor: vn158 <vn158 at seznam dot cz>

pkgname=ishisoft-pushover
pkgver=1.0
pkgrel=2
pkgdesc="Remake of Amiga puzzle game. Arrange the dominoes and knock them all over in one go."
arch=('i686' 'x86_64')
url="http://ishisoft.remakes.org/"
license=('custom')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=(unzip)
source=($pkgname http://ishisoft.remakes.org/downloads/ishisoft_pushover__.zip)
md5sums=('05e7653dce471f2edc8375065b585c85' '2afdfd4ef1c7cba4799b146dec6d62d8')
noextract=()
options=(!strip)

build() {
  cd "$startdir"

  install -d -m755 pkg/usr/share/$pkgname

  cp -ra src/Ishisoft\ Pushover/* pkg/usr/share/$pkgname
  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 pkg/usr/bin
  install -m755 $pkgname pkg/usr/bin
  cd pkg/usr/bin
  ln -s $pkgname $pkgname-editor
}
