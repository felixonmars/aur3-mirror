# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=pwgui
pkgver=5.1.1
pkgrel=2
pkgdesc="PWgui is a GUI for PWscf based programs from Quantum-ESPRESSO integrated suite of codes for electronic \
         structure calculations and materials modeling at the nanoscale."
arch=('i686' 'x86_64')
url='http://www-k3.ijs.si/kokalj/pwgui/'
license=('GPLv2')
depends=('iwidgets')
source=("http://www-k3.ijs.si/kokalj/pwgui/download/PWgui-${pkgver}.tgz"
        "pwgui.desktop")
sha512sums=('ce6ba4cd3cec26ec5d931e1a62a4e64343c8c86a079a8c13eef7ae0928eae37439eaefe6ebdaf76e78bde17454ff52ab4e9547127d27bd66601a380c92ba7afa'
            'b3fef37a4202dc30a907c0b23539ada250e3cebf4f93135474cdb8db320e5fd145a18dbd9d09a7d0470332bdd1da331ea8ec6e096257c0a794cc9ed592860fde')

package() {  
  install -m644 -D $srcdir/PWgui-$pkgver/init.tcl $pkgdir/usr/share/$pkgname/init.tcl
  install -m644 -D $srcdir/PWgui-$pkgver/pwgui_reformat.tcl $pkgdir/usr/share/$pkgname/pwgui_reformat.tcl
  install -m644 -D $srcdir/PWgui-$pkgver/pwgui.tcl $pkgdir/usr/share/$pkgname/pwgui.tcl
  install -m644 -D $srcdir/PWgui-$pkgver/pwgui.settings $pkgdir/usr/share/$pkgname/pwgui.settings
  install -m755 -D $srcdir/PWgui-$pkgver/pwgui $pkgdir/usr/share/$pkgname/pwgui
  install -m755 -D $srcdir/PWgui-$pkgver/pwgui_reformat $pkgdir/usr/share/$pkgname/pwgui_reformat
  install -m644 -D $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  mkdir -p $pkgdir/usr/bin
  ln -s "$pkgdir/usr/share/$pkgname/pwgui" "$pkgdir/usr/bin/pwgui"
  ln -s "$pkgdir/usr/share/$pkgname/pwgui_reformat" "$pkgdir/usr/bin/pwgui_reformat"
  cd $srcdir/PWgui-$pkgver
  cp -dr --no-preserve=mode,ownership doc examples images lib modules src tests $pkgdir/usr/share/$pkgname/
}

