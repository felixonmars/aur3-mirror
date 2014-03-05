# Author: wain <wain.at.archlinux.fr>
pkgname=customizepkg-ald
pkgbase="${pkgname%-*}"
pkgver=0.2.2
pkgrel=1
pkgdesc="A tool to modify automatically PKGBUILD" 
url="http://www.archlinux.fr/" 
license="GPL" 
arch=('any')
depends=() 
conflicts=('customizepkg')
replaces=('customizepkg')
source=("$pkgbase-$pkgver.src.tar.gz")
sha512sums=('704f7197f6ed8f4e59fd7903ce0ef499e417787ccf0c11ed947c03e4cd34d3da52a16e4fbfef78b4be7dbb077d25890e6a0f825a9150cbdecc62cbe72a18bd1b')

package() { 
  	install -D -m 755 "$srcdir"/$pkgbase/$pkgbase "$pkgdir"/usr/bin/$pkgbase 
  	install -D -m 755 "$srcdir"/$pkgbase/epdfview.example "$pkgdir"/etc/customizepkg.d/epdfview.example 
  	install -D -m 755 "$srcdir"/$pkgbase/kqemu.example "$pkgdir"/etc/customizepkg.d/kqemu.example 
  	install -D -m 755 "$srcdir"/$pkgbase/qemu.example "$pkgdir"/etc/customizepkg.d/qemu.example 
  	install -D -m 755 "$srcdir"/$pkgbase/mplayer.example "$pkgdir"/etc/customizepkg.d/mplayer.example 
  	install -D -m 755 "$srcdir"/$pkgbase/qt.example "$pkgdir"/etc/customizepkg.d/qt.example 
  	install -D -m 755 "$srcdir"/$pkgbase/vim.example "$pkgdir"/etc/customizepkg.d/vim.example 
}
