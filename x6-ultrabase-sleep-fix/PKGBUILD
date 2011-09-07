# Maintainer: Dominik Mayer <dominik.mayer@gmail.com>
pkgname=x6-ultrabase-sleep-fix
pkgver=1.0
pkgrel=1
pkgdesc="Undocks the X6* from the UltraBase before suspending it"
arch=('any')
url="http://www.thinkwiki.org/wiki/X6_UltraBase#Fix_for_undocking_while_Laptop_sleeps_for_any_distribution"
license=('unknown')
source=(99-x61-docking)
md5sums=('0e5295925c4ee06a13a9444c51655e86')    

build() {
  mkdir "$pkgdir/etc"
  mkdir "$pkgdir/etc/pm"
  mkdir "$pkgdir/etc/pm/sleep.d"
  cp 99-x61-docking $pkgdir/etc/pm/sleep.d
}
