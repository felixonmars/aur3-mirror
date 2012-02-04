# Contributor: Skunnyk <skunnyk@archlinux.fr>
pkgname=keybinder
pkgver=0.2.2
pkgrel=2
pkgdesc="libkeybinder is a library for registering global keyboard shortcuts. Keybinder works with GTK-based applications using the X Window System."
arch=(i686 x86_64)
url="http://kaizer.se/wiki/keybinder/"
license=('GPL')
depends=('pygtk' 'lua')
provides=('libkeybinder' 'python-keybinder' 'lua-keybinder')
conflicts=('libkeybinder' 'python-keybinder' 'lua-keybinder')
options=('!libtool')
source=(http://kaizer.se/publicfiles/keybinder/$pkgname-$pkgver.tar.gz)
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHON="/usr/bin/python2"
  ./configure --prefix=/usr
  make || return 1
}
package() {	
  cd "$srcdir/$pkgname-$pkgver/"	
  make DESTDIR="$pkgdir/" install
}

md5sums=('b4ccd4bd19f3ae3f0ab2cbda11fcd3ac')
