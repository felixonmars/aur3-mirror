# $Id: PKGBUILD,v 1.0 2009/05/20 23:17:10 Phillipe $
# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>

pkgname=wbar-patched
pkgver=1.3.3
pkgrel=1
arch=('i686' 'x86_64')
depends=('imlib2')
makedepends=('patch')
conflicts=('wbar')
provides=('wbar')
pkgdesc="A quick launch bar developed with speed in mind and with a patch to down or up the position of bar as you like."
url="http://code.google.com/p/wbar"
license=('GPL')
source=(http://www.smithux.com/docs/wbar-patched/wbar-1.3.3.patch.tgz
        http://www.smithux.com/docs/wbar-patched/wbar-gcc430_and_warnings.patch)
md5sums=('a683e3129ed50899a9a18f706eab78d8'
         '6b4e9e104a066a822d442813afc20c67')

build() {
  cd $srcdir/wbar-$pkgver.patch
  patch < $srcdir/wbar-gcc430_and_warnings.patch
  make || return 1

  install -Dm755 wbar $pkgdir/usr/bin/wbar

  sed -i "s|i\: |i\: /usr/share/wbar/|" dot.wbar
  sed -i "s|t\: iconpack/wbar.osx/font/12|t\: /usr/share/wbar/iconpack/comic/12|" dot.wbar
  install -Dm644 dot.wbar $pkgdir/usr/share/wbar/dot.wbar

  install -d $pkgdir/usr/share/wbar/iconpack/wbar.osx
  install -m644 iconpack/*ttf $pkgdir/usr/share/wbar/iconpack
  install -m644 iconpack/wbar.osx/*png $pkgdir/usr/share/wbar/iconpack/wbar.osx
}
