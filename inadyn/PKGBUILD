# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
# Contributor: Inxsible <inxsible at gmail dot com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=inadyn
pkgver=1.96.2
pkgrel=5
pkgdesc="A simple dynamic DNS updater"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20150218192035/http://inatech.eu/inadyn/"
license=('GPL')
depends=('bash')
backup=(etc/inadyn.conf)
source=("http://web.archive.org/web/20140816232452/http://www.inatech.eu/inadyn/inadyn.v$pkgver.zip" inadyn.conf inadyn.service)
md5sums=('702a127f13b96eee38d60c6f30b20efa'
         'f910c5778add779dfef4d680108513a2'
         '85d2fbe3b45aba719fcb6f7085a3ae47')

build() {
  cd "$srcdir/inadyn"
  make
}

package() {
  cd "$srcdir/inadyn"
  install -Dm755 bin/linux/inadyn $pkgdir/usr/bin/inadyn
  install -Dm644 man/inadyn.8 $pkgdir/usr/share/man/man8/inadyn.8
  install -Dm644 man/inadyn.conf.5 $pkgdir/usr/share/man/man5/inadyn.conf.5
  install -Dm644 readme.html $pkgdir/usr/share/doc/inadyn/readme.html
  install -Dm644 ../inadyn.conf $pkgdir/etc/inadyn.conf
  install -Dm644 ../inadyn.service $pkgdir/usr/lib/systemd/system/inadyn.service
}
