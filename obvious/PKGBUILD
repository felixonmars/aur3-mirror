# Contributor: dx <dx@dxzone.com.ar>
# Maintainer: Andrei "Garoth" Thorp <garoth at the fabulous gmail dot com>
pkgname=obvious
pkgver=3.3.2
pkgrel=1
pkgdesc="Advanced widgets for the Awesome window manager."
arch=('any')
url="http://awesome.naquadah.org/wiki/Obvious"
license=('custom:MIT')
depends=("awesome>=$pkgver")
source=("http://git.mercenariesguild.net/releases/obvious/obvious-3.3.2.tar.gz")
md5sums=('88611169031ab3e50eee105b41ec1de7')

build() {
  cd ${srcdir}
  install -Dm644 ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE &&
  rm -f ${pkgname}/{.gitignore,AUTHORS,CONTRIBUTING,LICENSE,TODO} &&
  install -dm755 ${pkgdir}/usr/share/awesome/lib &&
  cp -a ${pkgname} ${pkgdir}/usr/share/awesome/lib/${pkgname} || return 1
}
# vim:set ts=2 sw=2 et:
