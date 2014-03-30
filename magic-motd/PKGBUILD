# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=magic-motd
pkgver=r14.0aaadb4
pkgrel=1
pkgdesc="Generate MOTDs dynamically at boot time"
arch=('any')
url="http://bitbucket.org/instarch/magic-motd"
license=('BSD')
depends=('filesystem' 'systemd' 'ncurses')
makedepends=('git')
provides=('magic-motd')
backup=(
  'etc/conf.d/magic-motd.conf'
)
source=(
  'magic-motd.conf'
  'magic-motd'
  'magic-motd.service'
  'magic-motd-ip'
  'magic-motd-ip.service'
)
md5sums=('5d3ddc642cad1695602af18e609c519e'
         '0255d61d20ac65d75e687a4c5a49d7b5'
         'a3497a52b918097bdcd36109b8d52cbd'
         '99d2541feecebc68f8410515f02d9bcb'
         '27b18dc9e5e02b4e7e32a56997918c1d')

_gitroot=http://bitbucket.org/instarch/magic-motd
_gitname=magic-motd-git

pkgver() {
  cd "$srcdir/$_gitname-build"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  install -D magic-motd.conf "${pkgdir}/etc/conf.d/magic-motd.conf"
  install -Dm644 magic-motd.service "${pkgdir}/usr/lib/systemd/system/magic-motd.service"
  install -Dm644 magic-motd-ip.service "${pkgdir}/usr/lib/systemd/system/magic-motd-ip.service"

  install -D -m755 magic-motd "${pkgdir}/usr/bin/magic-motd"
  install -D -m755 magic-motd-ip "${pkgdir}/usr/bin/magic-motd-ip"

  install -d -m700 "${pkgdir}/etc/magic-motd.d"

  cp magic-motd.d/* "${pkgdir}/etc/magic-motd.d/"
}

# vim:set ts=2 sw=2 et:
