# Maintainer: TDY <tdy@gmx.com>

pkgname=hoxchess
pkgver=1.0.0
pkgrel=2
pkgdesc="A single-player and network client for Xiangqi (Chinese chess)"
arch=('i686' 'x86_64')
url="http://hoxchess.googlecode.com/"
license=('GPL3')
depends=('wxgtk2.9')
source=(http://$pkgname.googlecode.com/files/HOXChess_src_v$pkgver.zip
        $pkgname-$pkgver-paths.diff
        $pkgname.desktop)
md5sums=('8dd87c922ad6ba93a9648f70d5476db2'
         '97dfbdf577845500ee13379d9cbad623'
         '02fc24d1f0442b8ef3122f4f19ae21fc')

build() {
  cd "$srcdir/hox_Project"
  patch -Np0 -i ../$pkgname-$pkgver-paths.diff
  make -C plugins/AI_XQWLight
  make -C plugins/AI_HaQiKiD
  make -C plugins/AI_MaxQi
  make -C plugins/AI_Folium
  make -C plugins/AI_TSITO
  make -C hox_Client
}

package() {
  cd "$srcdir/hox_Project"
  install -Dm755 hox_Client/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  # libs
  install -Dm755 plugins/AI_Folium.so "$pkgdir/usr/lib/$pkgname/AI_Folium.so"
  install -Dm755 plugins/AI_HaQiKiD.so "$pkgdir/usr/lib/$pkgname/AI_HaQiKiD.so"
  install -Dm755 plugins/AI_MaxQi.so "$pkgdir/usr/lib/$pkgname/AI_MaxQi.so"
  install -Dm755 plugins/AI_TSITO.so "$pkgdir/usr/lib/$pkgname/AI_TSITO.so"
  install -Dm755 plugins/AI_XQWLight.so "$pkgdir/usr/lib/$pkgname/AI_XQWLight.so"

  # resources
  install -dm755 "$pkgdir/usr/share/$pkgname/"
  cp -a resource/* "$pkgdir/usr/share/$pkgname/"
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 '{}' \;
}

# vim:set ts=2 sw=2 et:
