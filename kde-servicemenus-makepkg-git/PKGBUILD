# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgname=kde-servicemenus-makepkg-git
pkgver=0.r33.35bbe5e
pkgrel=1
pkgdesc="Kde servicemenu for makepkg"
arch=('any')
url="https://github.com/udeved/kde-makepkg-servicemenu"
license=('GPL2')
depends=('kdebase-dolphin' 'namcap' 'pacman')
makedepends=('git')
conflicts=('kde-servicemenus-makepkg')
install=makepkg.install
source=("$pkgname"::'git://github.com/udeved/kde-makepkg-servicemenu.git')
md5sums=('SKIP')

pkgver() {
      cd "$srcdir/$pkgname"
      printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
      cd "$pkgname"

      install -Dm755 bin/pkg-magic $pkgdir/usr/bin/pkg-magic
      install -Dm644  ServiceMenus/pkg-magic.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/pkg-magic.desktop
      install -Dm644 mime/application/x-pkgbuild.xml $pkgdir/usr/share/mime/application/x-pkgbuild.xml
      install -Dm644 mime/packages/application-x-pkgbuild.xml $pkgdir/usr/share/mime/packages/application-x-pkgbuild.xml

}
