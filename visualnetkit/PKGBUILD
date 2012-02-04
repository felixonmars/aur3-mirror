# Contributor: Nazarov Pavel <genocid@rambler.ru>
pkgname=visualnetkit
pkgver=1.0
pkgrel=1
pkgdesc="Graphical environment written in C++ and Qt4 that allows to configure and manage a Netkit lab in a very simple and intuitive way."
arch=('i686')
url="http://code.google.com/p/visual-netkit/"
license=('GPL3')
depends=('qt>=4.4')
source=(http://visual-netkit.googlecode.com/files/VisualNetkit-$pkgver.tar.gz visualnetkit.desktop visualnetkit.sh)
md5sums=('71d19cadf17b9708aee41ef785d0db4c'
                 '5ccbba0db95916988dd1c75aa1c6b266'
                 '7624eae9ce0f0035bf11dc6b25dd6438')


build() {
  cd $startdir/src/$pkgname-$pkgver/src/plugin_dev
  for i in ./*
  do
   cd $i
   qmake -after DESTDIR="$pkgdir/usr/lib/visualnetkit/" || return 1
   make || return 1
   cd ..
  done

  cd $startdir/src/$pkgname-$pkgver
  qmake -after DESTDIR="$pkgdir/usr/bin/" VisualNetkit.pro || return 1
  make || reurn 1

  install -Dm 644 "$srcdir/$pkgname-$pkgver/resources/big_icons/visualnetkit.png" "$pkgdir/usr/share/pixmaps/visualnetkit.png"
  install -Dm 644 "$srcdir/visualnetkit.desktop" "$pkgdir/usr/share/applications/visualnetkit.desktop"
  install -Dm 755 "$srcdir/visualnetkit.sh" "$pkgdir/usr/bin/visualnetkit-start"
}