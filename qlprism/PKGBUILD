# Maintainer: Ole Bergmann <ole@ole.im>

pkgname=qlprism
pkgver=4.36
pkgrel=1
pkgdesc="Lightweight Quake Live stand-alone launcher based on Mozilla Lab's Prism"
arch=("i686" "x86_64")
url="http://www.qlprism.us/"
license=("custom")
install=qlprism.install
depends=(gtk2)

source=(
 "http://ares.discord.us/$pkgname-$pkgver-linux-$CARCH.tar.gz"
 "qlprism"
)

md5sums=(
 "45e607a59a7ac6f9dd44b0d4b2709939"
 "7b1afbad65768077fa7295098f21e1cb"
)

[[ "${CARCH}" == i686 ]] && md5sums[0]="21fe83d40b4c3a4289161774ca8f7115"
[[ "${CARCH}" == x86_64 ]] && depends+=(lib32-gtk2 lib32-libxdamage lib32-libxt lib32-pcre)

package () {
  install -dm755 "$pkgdir"/opt
  cp -r qlprism-"$CARCH" "$pkgdir"/opt/"$pkgname"
  chgrp -R games "$pkgdir"/opt/"$pkgname"
  chmod -R g+w "$pkgdir"/opt/"$pkgname"
  install -Dm755 qlprism "$pkgdir"/usr/bin/qlprism
}
