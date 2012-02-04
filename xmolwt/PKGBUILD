# Maintainer: Mark Coolen <mark.coolen@gmail.com>
pkgname=xmolwt
pkgver=0.7
pkgrel=1
pkgdesc="This program calculates formula weight and percent composition for the given chemical formula."
arch=('i686')
url="http://www.st.hirosaki-u.ac.jp/~rmiya/xmolwt/xmolwt-e.html"
license=('custom')
depends=('gtk')
source=('http://www.st.hirosaki-u.ac.jp/~rmiya/$pkgname/$pkgname-$pkgver.tar.gz')
md5sums=('2bbd0b80595d768e0ea286dca69955a1')

build() {
  pushd "$srcdir/$pkgname-$pkgver"
  sed "s/gtk12-config/gtk-config/" Makefile.gtk > Makefile
  make

  install -m 755 -d $pkgdir/usr/bin
  install -m 755 gmolwt $pkgdir/usr/bin
  pushd $pkgdir/usr/bin
  ln -s gmolwt molwt
  popd

  install -m 755 -d $pkgdir/usr/share/doc/$pkgname
  install -m 644 -t $pkgdir/usr/share/doc/$pkgname/ Readme Howtouse.jp xmolwt.html xmolwt-e.html gmolwt.gif xmolwt.gif dot.gtkrc 

  install -m 755 -d $pkgdir/usr/share/applications
  cat > $pkgdir/usr/share/applications/gmolwt.desktop <<EOF
[Desktop Entry]
Name=gmolwt
Comment=Molecular Weight Calculator
Comment[ja]=\262\275\263\330\301\310\300\256\274\260\244\253\244\351ʬ\273\322\316̤\362\267\327\273\273
Exec=gmolwt
Terminal=0
Type=Application
EOF
}