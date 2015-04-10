# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Tasos Latsas <tlatsas2000 at gmail dot com>

pkgname=ikog
pkgver=1.90
pkgrel=1
pkgdesc="A GTD-oriented task manager that doubles as a portable todo list"
arch=('any')
url="http://www.henspace.co.uk/ikog/"
license=('GPL')
depends=('python2')
source=($pkgname.py.gz::"https://sites.google.com/site/henspace/$pkgname/$pkgname-files/${pkgname}_$pkgver.py.gz?attredirects=0&d=1"
        $pkgname.css::"https://sites.google.com/site/henspace/$pkgname/$pkgname-files/$pkgname.css?attredirects=0&d=1"
        $pkgname.launcher)
sha256sums=('054a60237b2cde39aa2f26ac0c9c6d98cb025c7a616d246e3e6b034d3fdbf2eb'
            '0f851393b403ab44b93a9d4d0cacd9b761966d4fd978d2498cd3fec724105d40'
            'da5233f2d733c4f884aca5c93d084578e1353bcdae5c49ad9ec78f8760448633')

package() {
  cd "$srcdir"
  sed -i 's/from md5/from hashlib/; s,#!/usr/bin/env python,&2,' $pkgname.py
  install -Dm644 $pkgname.py "$pkgdir/usr/share/$pkgname/$pkgname.py"
  install -Dm644 $pkgname.css "$pkgdir/usr/share/$pkgname/$pkgname.css"
  install -Dm755 $pkgname.launcher "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
