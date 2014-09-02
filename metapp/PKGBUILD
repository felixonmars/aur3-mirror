# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=metapp
pkgver=1.52
pkgrel=1
pkgdesc="A general-purpose text preprocessor designed to add macros to macros-less programming languages."
arch=('any')
url="http://www.metaware.fr/metapp/"
license=('GPL3')
depends=('perl')
source=("http://www.metaware.fr/metapp/metapp")
md5sums=('4ec2a7fd26331a344540ead75e8449f0')

package () {
  cd "$srcdir/.."
  install -Dm755 'metapp' "$pkgdir"/usr/bin/metapp
}
