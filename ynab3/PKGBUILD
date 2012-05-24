# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Julian David Rath <julian.rath@gmail.com>
pkgname=ynab3
pkgver=3.6.0.5
pkgrel=1
pkgdesc="YNAB3 - You Need a Budget, latest version will be downloaded"
arch=('x86', 'x86_64')
url="http://www.youneedabudget.com/"
license=('custom:proprietary')
depends=('adobe-air')
makedepends=('unzip')
source=('http://download.youneedabudget.com/ynab3/live/YNAB3_Live_3.6.0.5.air'
        'ynab3.sh'
        'ynab3.desktop')
noextract=('YNAB3_Live_3.6.0.5.air')
#generate with 'makepkg -g'
md5sums=('79379553e925df94a00354625c4334ce'
         '18f2781ae077c95c8bd28918d2006c7e'
         '3e1df8c63579532838d5d1e8a28256a3')

package() {
  cd "$srcdir"
  
  install -dm755 "$pkgdir"/opt/airapps/ynab3
  install -dm755 "$pkgdir"/usr/{bin,share/{pixmaps,applications}}

  unzip YNAB3_Live_3.6.0.5.air -d "$pkgdir"/opt/airapps/ynab3

  ##icon
  install -m644 "$pkgdir"/opt/airapps/ynab3/assets/Ynab3-AppIcon.png "$pkgdir"/usr/share/pixmaps/

  ##startupscript
  install -m755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -m644 $pkgname.desktop "$pkgdir/usr/share/applications"

}

# vim:set ts=2 sw=2 et:
