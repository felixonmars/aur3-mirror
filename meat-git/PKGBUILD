# Contributor: Daniel Mills <dm@e36freak.com>

pkgname=meat-git
pkgver=93.af634b3
pkgrel=1
pkgdesc="A simple fast AUR helper, using cower as a back end"
arch=('i686' 'x86_64')
url="http://github.com/e36freak/meat"
license=('MIT')
depends=('bash>=4.0' 'cower' 'awk')
makedepends=('git')
optdepends=('sudo: highly recommended')
source=('git://github.com/e36freak/meat.git')
md5sums=('SKIP')
_gitname='meat'

pkgver() {
  cd "$_gitname" &&
  printf '%s.%s\n' "$(git rev-list --count HEAD)" \
                   "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname" &&
  install -m 755 -D meat "$pkgdir/usr/bin/meat" &&
  install -m 644 -D config "$pkgdir/usr/share/meat/config"
}

# vim: ft=sh syn=sh et
