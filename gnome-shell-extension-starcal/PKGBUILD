# Maintainer: ghArch <free.gharch[at]gmail.com>
pkgname=gnome-shell-extension-starcal
pkgver=3.2
pkgrel=1
pkgdesc="Integrate StarCal with Gnome Shell's top bar"
arch=(any)
url="http://hedayat.fedorapeople.org/misc/starcal-gnome-shell-extension/"
license=('GPL')
depends=('gnome-shell>=3.2.0' 'starcal2')
source=(http://hedayat.fedorapeople.org/misc/starcal-gnome-shell-extension/$pkgname-$pkgver.tar.gz)
md5sums=('75e8850098f42290b04604d5ec49ae24')
build() {
  cd "$srcdir/starcal@hedayatvk.wordpress.com/" 
  sed -i 's/starcal2.py/starcal2_gtk.py/g' extension.js
  sed -i 's/starcal.py/starcal_gtk.py/g' extension.js
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/
  cp -r ${srcdir}/starcal@hedayatvk.wordpress.com ${pkgdir}/usr/share/gnome-shell/extensions/  
  
}

