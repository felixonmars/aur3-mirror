# Maintainer: Oliver Kraitschy <okraits at arcor dot de>

pkgname=omodoro-git
pkgver=r10.51b537b
pkgrel=1
pkgdesc='Simple commandline tool to use the pomodoro technique'
arch=('any')
url='https://github.com/okraits/omodoro'
license=('GPL')
depends=('python' 'libnotify')
makedepends=('git')
source=('git://github.com/okraits/omodoro.git')
sha1sums=('SKIP')

_gitname='omodoro'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"

  install -Dm755 omodoro  "${pkgdir}/usr/bin/omodoro"
  install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:

