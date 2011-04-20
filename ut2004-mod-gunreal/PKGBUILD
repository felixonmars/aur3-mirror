# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

pkgname=ut2004-mod-gunreal
pkgver=beta5
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
url="http://gunreal.com"
license=('unknown')
depends=(ut2004)
makedepends=(unzip)
source=(http://www.gunreal.com/updater/Gunreal%20Beta.zip ut2004-mod-gunreal.desktop gunreal.sh)
md5sums=('fde9d00220e01f7620a3886cbbbfc416'
         'c7a6aad1e9480aca28d112f1417c8608'
         'a28202b8f4209d067dcff1dd2fd5d9b9')

package() {
  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/opt/ut2004
  rm Gunreal/*.bat Gunreal/Updater*
  mv Gunreal $pkgdir/opt/ut2004/
  install -D -m 644 $srcdir/ut2004-mod-gunreal.desktop $pkgdir/usr/share/applications/ut2004-mod-gunreal.desktop
  install -D -m 555 $srcdir/gunreal.sh $pkgdir/opt/ut2004/Gunreal/gunreal.sh
  if [ "$CARCH" == "x86_64" ]; then
    sed -i 's/ut2004-bin/&-linux-amd64/g' $pkgdir/opt/ut2004/Gunreal/gunreal.sh
  fi
}
