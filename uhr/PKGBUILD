# Maintainer: Dominik George <nik@naturalnet.de>

pkgname=uhr
pkgver=1.5
pkgrel=2
pkgdesc="A full-screen Unicode analog clock for the terminal written in mksh"
arch=('any')
url="https://www.mirbsd.org"
license=('MirOS')
depends=('bc' 'mksh')
source=("uhr::https://www.mirbsd.org/cvs.cgi/~checkout~/contrib/hosted/tg/uhr?rev=$pkgver;content-type=text%2Fplain"
        uhr-mkshR40.diff
        uhr@.service)
md5sums=('e9fa8c8d9f8ed59e07f6843eb29c3f21'
         '074933ee4fc61d46e0e5329def30c6a4'
         '7de3162a12ef14386d26bc3f38f84ce6')

build() {
 cd "$srcdir"
 patch uhr uhr-mkshR40.diff
}

package() {
 install -D -m 755 "$srcdir/uhr" "$pkgdir/usr/bin/uhr"
 install -D -m 644 "$srcdir/uhr@.service" "$pkgdir/usr/lib/systemd/system/uhr@.service"
}
