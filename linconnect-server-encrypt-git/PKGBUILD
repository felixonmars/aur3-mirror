# Maintainer: Agnotek <agnostic.sn (at) gmail.com>
pkgname=linconnect-server-encrypt-git
pkgver=r91.13d3e26
pkgrel=1
pkgdesc="Server for the linconnect android application the mirrors android notifications to desktop using libnotify"
url="https://github.com/hauckwill/linconnect-server"
license=('GPL3')
arch=('any')
groups=(network)
depends=('python2' 'python2-cherrypy' 'python2-gobject' 'pybonjour' 'libnotify')
makedepends=('git')
source=("master"::'git://github.com/hauckwill/linconnect-server.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/master"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p $pkgdir/usr/{bin,share/}
  cp -r $srcdir/master/LinConnectServer/main/ $pkgdir/usr/share/linconnect-server
  cat >$pkgdir/usr/bin/linconnect-server <<EOF
#!/bin/sh
exec python2 /usr/share/linconnect-server/linconnect_server.py
EOF
  chmod +x $pkgdir/usr/bin/linconnect-server
}
