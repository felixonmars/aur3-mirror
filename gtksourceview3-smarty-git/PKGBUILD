# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
pkgname=gtksourceview3-smarty-git
pkgver=5aea1ad
pkgrel=1
pkgdesc="Smarty syntax highlighting for gtksourceview3 (including gedit)"
arch=('any')
url="https://github.com/dandelionmood/Smarty-syntax-coloration-for-GEdit"
license=('GPL')
depends=('shared-mime-info' 'gtksourceview3')
makedepends=('git')
install="$pkgname.install"
source=('git+https://github.com/dandelionmood/Smarty-syntax-coloration-for-GEdit.git')
md5sums=('SKIP')

_gitname="Smarty-syntax-coloration-for-GEdit"

pkgver () {
  cd $srcdir/$_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd $srcdir/$_gitname
  
  install -Dm644 "smarty.lang" "$pkgdir/usr/share/gtksourceview-3.0/language-specs/smarty.lang"
  install -Dm644 "smarty.xml" "$pkgdir/usr/share/mime/packages/smarty.xml"
}

# vim:set ts=2 sw=2 et:
