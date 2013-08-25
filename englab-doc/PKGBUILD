# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=englab-doc  
pkgver=0.3
pkgrel=1 
pkgdesc="Documentation for englab (one PDF-File)"
url="http://englab.bugfest.net"
arch=('any')
license=('GPL')
source=("$pkgname-$pkgver.pdf::http://sourceforge.net/projects/englab/files/EngLab%20Documentation/EngLab%200.3/EngLab_$pkgver.pdf")
md5sums=('4010c012b161d9e59915d92ce9629f9e')
options=('docs')

package() {
  install -Dm544 $srcdir/$pkgname-$pkgver.pdf \
    $pkgdir/usr/share/doc/englab/$pkgname-$pkgver.pdf
  }
