# Maintainer: William Giokas <1007380@gmail.com>

pkgname=scudmenu-git
_pkgname=scudmenu
pkgver=0.r5.973c708
pkgrel=1
epoch=1
pkgdesc="A script combining systemctl --user and dmenu"
arch=('any')
url="https://bitbucket.org/KaiSforza/scudmenu"
license=('MIT')
depends=('dmenu' 'rxvt-unicode')
optdepends=('proggyfonts: Default fonts for this script')
conflicts=('scudmenu')
provides=('scudmenu')

source=('git+https://KaiSforza@bitbucket.org/KaiSforza/scudmenu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.r$(git rev-list --count master).$(git describe --always )"
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 scudmenu "$pkgdir/usr/bin/scudmenu"
}
