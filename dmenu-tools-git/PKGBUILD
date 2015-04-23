# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=dmenu-tools-git
_pkgname=dmenu-tools
pkgver=3.1.0.r15.g171dcc7
pkgrel=1
pkgdesc="collection of scripts powered by dmenu"
arch=(any)
url="https://github.com/tlvince/dmenu-tools"
license=("MIT")
depends=("dmenu")
optdepends=("netcfg: dmenu_netcfg dependency"
            "mpc: dmenu_mpc dependency"
            "wmctrl: dmenu_raise{,_or_run} dependency")
makedepends=("git")
install=$_pkgname.install
source=(git://github.com/tlvince/dmenu-tools.git)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
