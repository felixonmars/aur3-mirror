# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=notimetoexplain
pkgver=15
pkgrel=1
pkgdesc="platformer game about Time Travel, Big Jetpack Guns, Giant Enemy Crabs and Ribs in People's Eyes"
arch=('i686' 'x86_64')
url="http://tinybuildgames.com"
license=("custom:shareware")
md5sums=('b3e94332eab0cb54232fc25795e15b7c'
         'c90aed310ef26468431a8b480b11b70a')
options=('!strip')

source=("No_Time_To_Explain_WinMacLin_v${pkgver}.zip" ${pkgname}.desktop)
depends=('libidn' 'libxt' 'libxxf86vm' 'gtk2' 'sqlite3')

build() {
true
}

package() {
  install -Dm755 $srcdir/No\ Time\ To\ Explain\ Linux\ v1 $pkgdir/usr/bin/notimetoexplain
  install -Dm644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
