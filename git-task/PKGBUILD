# Maintainer: slowpoke <mail+aur@slowpoke.io>
pkgname=git-task
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="an issue tracker for git"
arch=(any)
url="https://github.com/proxypoke/git-task"
license=('custom:Anti-License')
depends=('git' 'task')
makedepens=('unzip')
source=("https://github.com/proxypoke/git-task/archive/${pkgver}.zip")
md5sums=('2beb7cd6ac91885ed2c482251f93de4d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"/{doc,licenses}/git-task
  install -Tm 0755 git-task.sh "${pkgdir}/usr/bin/git-task"
  install -m 0444 README.asciidoc "${pkgdir}/usr/share/doc/git-task/"
  install -m 0444 COPYING "${pkgdir}/usr/share/licenses/git-task/"
}

# vim:set ts=2 sw=2 et:
