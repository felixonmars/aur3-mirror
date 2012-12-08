# $Id: PKGBUILD 61412 2009-12-15 20:58:43Z jgc $
# Contributor: Jan de Groot	  <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler	  <thomas@archlinux.org>
# Contributor: Alexander Baldeck  <alexander@archlinux.org>
# Maintainer:  Federico Cinelli	  <cinelli.federico@gmail.com>

pkgname=xf86-input-synaptics-jumpycursor
pkgver=1.2.1
pkgrel=1
pkgdesc="synaptics driver for notebook touchpads with jumpy cursor patch." 
arch=('any')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxi>=1.3' 'libxtst>=1.1.0')
makedepends=('pkgconfig' 'xorg-server>=1.7.0' 'patch')
conflicts=('xorg-server<1.7.0')
replaces=('synaptics' 'xf86-input-synaptics')
provides=('synaptics')
conflicts=('synaptics' 'xf86-input-synaptics')
groups=('xorg-input-drivers')
options=(!libtool)
source=(http://xorg.freedesktop.org/releases/individual/driver/xf86-input-synaptics-$pkgver.tar.bz2
        11-x11-synaptics.fdi jumpycursor.patch)
md5sums=('29a6f9da5123149e4abc8ff83880ed5c'
         'c004465562908b842817d93605a867b2'
	 'd0b21ce9c77e4b6c4403b1fca01fdffd'
	 )
install=jumpy.install

build() 
{
  patch -p1 < "$srcdir/jumpycursor.patch"

  cd "$srcdir/xf86-input-synaptics-$pkgver"

  ./configure --prefix=/usr
  make
}
package() {
  make -C "$srcdir/$_gitname-build" PREFIX=/usr DESTDIR="$pkgdir" install
  
  install -d "$pkgdir/usr/share/hal/fdi/policy/10osvendor"
  install -m644 "$srcdir/11-x11-synaptics.fdi" "$pkgdir/usr/share/hal/fdi/policy/10osvendor/"
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
