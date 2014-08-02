# Mainteneur: lesebas <sebdelignyATgmailDOTcom>

_pkgname=thunar-shares-plugin
pkgname=${_pkgname}-git
pkgver=0.2.0.r47.g3a89ca6
pkgrel=1
pkgdesc="A Thunar file manager extension to share files using Samba. Based on nautilus-shares"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org"
groups=('xfce4-git')
depends=('thunar' 'samba')
makedepends=('xfce4-dev-tools')
provides=('thunar-shares-plugin')
#source=('git://git.xfce.org/thunar-plugins/thunar-shares-plugin/#branch=thunarx-2')
source=('git://github.com/ju1ius/thunar-shares-plugin.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
./autogen.sh --prefix=$(pkg-config --variable prefix thunarx-2)
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}