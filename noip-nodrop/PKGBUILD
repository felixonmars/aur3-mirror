pkgname=noip-nodrop
pkgver=2.1.9
pkgrel=1
pkgdesc="Dynamic DNS Client Updater for no-ip.com services (without root droppage)"
arch=('any')
url="http://www.noip.com/downloads.php?page=linux"
license=(GPL2)
depends=('glibc')
#optdepends=('sl: maximum steam locomotion')
#backup=('etc/no-ip2.conf')
source=(http://www.noip.com/client/linux/noip-duc-linux.tar.gz)
md5sums=('3b0f5f2ff8637c73ab337be403252a60')

build() { 
  cd "$srcdir/noip-2.1.9-1/"
  mv noip2.c noip2.c.bak
  sed 's/(nobody = getpwnam("nobody")) != NULL/0/g' noip2.c.bak > noip2.c
  make PREFIX=/usr CONFDIR=/etc
  echo "[Unit]
Description=No-IP Dynamic DNS Update Client
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/noip2 -c /etc/no-ip2.conf

[Install]
WantedBy=multi-user.target" > noip2.service
}

package() {
  cd "$srcdir/noip-2.1.9-1/"
  [[ -d "$pkgdir/usr/bin" ]] || mkdir -p "$pkgdir/usr/bin"
  [[ -d "$pkgdir/usr/lib/systemd/system" ]] || mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -m 755 noip2 "$pkgdir/usr/bin"
  install -m 644 noip2.service "$pkgdir/usr/lib/systemd/system"
}
