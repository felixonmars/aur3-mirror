# Maintainer: pictuga <generaleduweb at gmail dot com>

pkgname="searchproviders-git"

true && pkgbase="searchproviders-git"
true && pkgname=('searchproviders-gcalc-git' 'searchproviders-color-git')

pkgver=0.0.0
pkgrel=1
pkgdesc="A set of gnome shell search providers"
arch=('i686' 'x86_64')
url="https://github.com/war1025/SearchProviders/"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=(${pkgbase}::'git://github.com/pictuga/SearchProviders.git#branch=patch-1')
md5sums=('SKIP')

build() {
  cd "${pkgbase}"
  make
}

package_searchproviders-gcalc-git() {
  cd "${pkgbase}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install-gcalc
}

package_searchproviders-color-git() {
  cd "${pkgbase}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install-color
}
