# Maintainer: Benjamin Severs <seversbenjamin at gmail dot com>

pkgname=gitolite-git
pkgver=3.5.3.1.11.g8f1fd84
pkgrel=1
epoch=1
pkgdesc='Very fine-grained access control layer on top of Git'
arch=('any')
url='https://github.com/sitaramc/gitolite'
license=('GPL2')
depends=('git' 'perl')
conflicts=('gitolite-g2-git' 'gitolite-g3-git')
replaces=('gitolite-g3-git')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/sitaramc/${pkgname/-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  local ver=$(git describe --always | sed 's|-|.|g')
  echo ${ver:1}
}

package() {
  cd ${pkgname}
  install -dm 0755 "${pkgdir}"/usr/lib/gitolite "${pkgdir}"/usr/bin
  ./install -to "${pkgdir}"/usr/lib/gitolite
  ln -s /usr/lib/gitolite/gitolite "${pkgdir}"/usr/bin/
}

# vim:set ts=2 sw=2 et:
