pkgname=linpal
pkgver=0.5_fixed
pkgrel=2
pkgdesc="This software is a Linux based client for various Palace servers."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/linpal"
license=("GPL")
source=("http://downloads.sourceforge.net/linpal/linpal-${pkgver//_/-}.tar.bz2"
"missing-declarations.patch")
depends=(libglade curl openssl gtkmm)
md5sums=('faee16137da59a03dad3aba6e0a50f73'
         'b9719a895e02b70fc06cf168afd89147')

build() {
  cd "$srcdir/linpal-0.5"
  patch -i ../missing-declarations.patch
  make
}


package() {
  cd "$srcdir/linpal-0.5"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
  install -Dm755 linpal "$pkgdir/usr/share/$pkgname/linpal"
  install -m644 default.png "$pkgdir/usr/share/$pkgname/"
  install -m644 trans.png "$pkgdir/usr/share/$pkgname/"
  install -m644 world.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 world48.png "$pkgdir/usr/share/$pkgname/"
  install -m644 linpal.glade "$pkgdir/usr/share/$pkgname/"
  cp -rf {colors,faces} "$pkgdir/usr/share/$pkgname"
  ln -s /usr/share/$pkgname/linpal "$pkgdir/usr/bin/linpal"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 world.svg "$pkgdir/usr/share/icons/$pkgname.svg"
  echo '[Desktop Entry]
Version=0.5
Type=Application
Name=LinPal
Categories=Network
GenericName=Palace Client
Comment=
Exec=/usr/share/linpal/linpal
Icon=/usr/share/icons/linpal.svg' > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
