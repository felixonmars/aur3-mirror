# Maintainer: bud.de <bjoernbudde@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>


pkgname=jodin3
_pkgname=JOdin3CASUAL
pkgver=r1142
pkgrel=1
pkgdesc="A java implementation of ODIN"
arch=('x86_64')
url="http://goo.im/devs/AdamOutler/JOdin3/"
license=('GPL3')
depends=('heimdall' 'java-runtime')
source=("https://raw.githubusercontent.com/budb/Arch_Packages/master/Packages/JOdin3/$_pkgname-$pkgver-dist.tar.gz"
                "JOdin3.desktop")
sha512sums=('a1f93f380814b91abe98388cca3c23c38d01f62bbd48e3eb8bc662dd259d215a14a56d38d20374f27724f19f490829144facd3a80bfd4db71ec1f8598a08b2fe'
                        '30aae97b6a17498d644ffdcbe5b9ae92a57f977c14d130d6cfe90790049caa52857eed93373f831db3277fb38ed23328c866be1564dc2e9e76110231f8e77a4f')

package() {
  cd $srcdir

  install -d $pkgdir/{opt/jodin,/usr/bin}

  cp -r app runtime $_pkgname $pkgdir/opt/jodin

  ln -s /opt/jodin/$_pkgname $pkgdir/usr/bin/jodin

  install -D JOdin3.desktop $pkgdir/usr/share/applications/JOdin3.desktop
}
