# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: SimFox3 <google user simfox3>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=pinta-git
pkgver=r1524.eac16ee
pkgrel=1
pkgdesc="A drawing/editing program modeled after Paint.NET"
arch=('any')
url="http://pinta-project.com/"
license=('MIT')
depends=('mono-addins' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'intltool>=0.35.0')
provides=('pinta')
conflicts=('pinta')
install=$pkgname.install
source=($pkgname::git+https://github.com/PintaProject/Pinta.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 license-mit.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.mit"
  install -Dm644 license-pdn.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdn"
}

# vim:set ts=2 sw=2 et:
