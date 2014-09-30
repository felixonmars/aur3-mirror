# Maintainer: Baobab <megavillain at gmail dot com>
# Contributor: TDY <tdy@gmx.com>

pkgname=rachota
pkgver=2.4
pkgrel=5
pkgdesc="A portable timetracker for personal projects"
arch=('any')
url="http://rachota.sourceforge.net/"
license=('CDDL')
depends=('bash'
         'java-environment')
source=("http://downloads.sourceforge.net/rachota/Rachota%202.4/Rachota%202.4/rachota_${pkgver/.}.jar"
        "rachota.desktop"
        "rachota.sh")
md5sums=('5416f0b9399932a4e7395f861a90edd6'
         '8f10dc0dc9f6f71838b5109c24bf9c6b'
         'bcbf041aa83d064a1d753da5b8439c29')

package() {
  cd "$srcdir"
  install -Dm644 rachota_${pkgver/.}.jar "$pkgdir/usr/share/java/rachota/rachota.jar"
  install -Dm755 rachota.sh "$pkgdir/usr/bin/rachota"
  install -Dm644 org/cesilko/rachota/gui/images/logo_48.png "$pkgdir/usr/share/pixmaps/rachota.png"
  install -Dm644 rachota.desktop "$pkgdir/usr/share/applications/rachota.desktop"
}
