# Maintained by Procyon

pkgname=kingbash
pkgver=46
downloadname_kingbash="raw.php?i=xY6hBVxf" #main script
downloadname_kbdmenu="raw.php?i=gMe6jvjk" #dmenu clone
pkgrel=1
pkgdesc="Tab completion for bash with a menu."
arch=(any)
url="https://bbs.archlinux.org/viewtopic.php?id=101010"
depends=(bash)
license=(none)
install=$pkgname.install
source=(http://pastebin.com/$downloadname_kingbash
	http://pastebin.com/$downloadname_kbdmenu)
sha1sums=(07a1a06756d054fecca09c5fe96661357a2f84ba
	  1fb96b6f78b47b79888561a79185fe8def0d638c)

build() {
  cd "${srcdir}"
  sed -i 's/\r$//' "$downloadname_kingbash"
  sed -i 's/\r$//' "$downloadname_kbdmenu"
}
package() {
  cd "${srcdir}"
  install -D -m 644 "$downloadname_kingbash" "${pkgdir}/usr/bin/kingbash"
  install -D -m 755 "$downloadname_kbdmenu" "${pkgdir}/usr/bin/kbdmenu"
}
