# Maintainer: Gesh <moystovi@g.jct.ac.il>
pkgname=freedns-updater-git
pkgver=20120808
pkgrel=1
pkgdesc="Updates freedns.afraid.org dynamic dns domains"
arch=('any')
url="http://www.github.com/InvisibleEngineer/FreeDNS-Updater"
license=('custom:UNLICENSE')
depends=('python')
makedepends=('git')
install='freedns.install'
backup=('etc/freedns.conf')
changelog='CHANGELOG'
_gitroot="git://github.com/InvisibleEngineer/FreeDNS-Updater.git"
_gitname=FreeDNS-Updater

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
  msg "Starting install..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d -o nobody -g nobody "${pkgdir}/var/cache/$pkgname"
  install -D -m755 freedns.py "${pkgdir}/usr/bin/freedns"
  install -D -m744 freedns.cron "${pkgdir}/etc/cron.hourly/freedns"
  install -D -m644 -o root -g root freedns.conf "${pkgdir}/etc/"
  install -D -m644 UNLICENSE "${pkgdir}/usr/share/licenses/$pkgname/UNLICENSE"
}

# vim:set ts=2 sw=2 et:
