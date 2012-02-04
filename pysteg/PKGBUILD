# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=pySteg
pkgname=pysteg
pkgver=1.1
pkgrel=1
pkgdesc="A simple GUI frontend for the steghide (steganography) console application."
arch=(i686 x86_64)
url="https://github.com/vkolev/pySteg"
license=('GPL')
depends=('python2-gtkmozembed' 'steghide')
install="$pkgname.install"
source=("https://github.com/downloads/vkolev/$_pkg/$_pkg$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('6fabb381ebe8e2dd586bdf61c6103a76'
         'd906781c579818ec44d08d0d5a303fb6')

build() {
  cd "$srcdir/$_pkg"

  # python2 fixes + place config file in ~/.pySteg.conf
  sed -e "s|\(python2\)\.6|\1|" \
      -e "s|data/\($_pkg\.conf.*\)basepath|\.\1os.path.expanduser('~')|" \
      -i $pkgname.py
}

package() {
  cd "$srcdir/$_pkg"

  # data
  install -d "$pkgdir"/usr/{bin,share/$pkgname}
  cp -a [^L]* "$pkgdir/usr/share/$pkgname"

  # desktop - pixmaps
  install -Dm644 ../$pkgname.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/pySteg.png \
          "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # bin
  cat << EOF >> "$pkgdir/usr/bin/$pkgname"
#!/bin/bash
[ -f ~/.pySteg.conf ] || cp /usr/share/pysteg/data/pySteg.conf ~/.pySteg.conf
cd /usr/share/$pkgname && python2 $pkgname.py
EOF

  chmod +x "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
