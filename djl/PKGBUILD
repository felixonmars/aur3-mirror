# Maintainer: jsteel <mail at jsteel dor org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Contributor: Diablo150 < www.djl-linux.org >

pkgname=djl
pkgver=1.2.20
pkgrel=6
pkgdesc="Game manager inspired by Valve's Steam software for Windows"
arch=('any')
url='http://djl-linux.org/'
license=('GPL3')
depends=('python2-pyqt' 'python2-feedparser' 'python2-pygame')
makedepends=('gendesk')
source=("$url/maj_djl/Paquets-Arch/$pkgname-$pkgver-Arch.tar.gz"
        "$pkgname.patch")
sha256sums=('1b46c5ca92801a20d7eb502b8f7fa3c69e5c324f70f20311eec7f73e18c5e3ee'
            'f1a5cdc2c6f0c08ad74f48df92766700cf80b092ab1eb177c8987b4c2d664090')

prepare() {
  cd "$pkgname"

  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"

  # fix a read permission
  chmod +r $pkgname/libs/test_ws.py

  # various fixes, mostly related to the python 2 path
  patch -Np1 -i "$srcdir"/$pkgname.patch

  # fix an error
  sed 's/IndexError), x/IndexError) as x/g' -i "$pkgname/djl_main.py"

  # workaround for launching games with python2 instead of python
  sed 's|cd|export PATH="/usr/share/djl/bin:$PATH"\ncd|g' -i djl.sh
}

package() {
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -Dm755 "$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  cp -r "$pkgname"/* "$pkgdir/usr/share/$pkgname/"

  # workaround for launching games with python2 instead of python
  install -d "$pkgdir/usr/share/$pkgname/bin"
  ln -s /usr/bin/python2 "$pkgdir/usr/share/$pkgname/bin/python"

  cd "$pkgname"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
