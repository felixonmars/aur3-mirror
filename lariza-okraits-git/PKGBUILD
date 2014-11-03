# Maintainer: Oliver Kraitschy <okraits at arcor dot de>

pkgname=lariza-okraits-git
pkgver=r134.1eb7966
pkgrel=1
pkgdesc='Simple WebKitGTK+ Browser - fork by okraits with additional features'
arch=('i686' 'x86_64')
url='https://github.com/okraits/lariza'
license=('GPL')
depends=('gtk2' 'webkitgtk2')
makedepends=('git')
provides=('lariza')
conflicts=('lariza')
source=('git://github.com/okraits/lariza.git')
sha1sums=('SKIP')

_gitname='lariza'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "$_gitname"
  make 
}
package() {
  cd "$_gitname"

  install -Dm755 lariza  "${pkgdir}/usr/bin/lariza"
  install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set ts=2 sw=2 et:

