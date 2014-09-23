# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=xtimecomposer
pkgver=13.1.0
pkgrel=1
pkgdesc="Eclipse based IDE for the xCORE microcontrollers"
arch=('x86_64' 'i686')
url="https://www.xmos.com/products/tools/xtimecomposer"
license=('Custom')
provides=('xtimecomposer')
options=(!strip)
depends=(java-runtime)
source=('xtimecomposer.patch'
        'xtimecomposer')
md5sums=('9e96bc2d2a94b174d04bcc6d57874c5b'
         '7183cd2692d89b69fe230d052a0e3d6d')
_package="xTIMEcomposer-Community_13-Linux64-Installer(Community_13.1.0).tgz"

prepare() {
 if [[ ! -f "$_package" ]]; then
   echo 'You must download xTIMEcomposer and put
it into the `src` folder' && exit 1
  fi
  tar -xvf "$srcdir/$_package"
  cd "$srcdir/XMOS/xTIMEcomposer/Community_$pkgver/bin"
  patch < "$srcdir/xtimecomposer.patch"
}

package() {
	cd "$srcdir/XMOS/"
	mkdir -p "$pkgdir"/usr/{share,bin}
  cp -r xTIMEcomposer "$pkgdir/usr/share"
  cd "$pkgdir/usr/bin"
  install -m 755 "$srcdir/xtimecomposer" .
}
