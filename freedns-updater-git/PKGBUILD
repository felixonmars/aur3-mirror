# Maintainer: Gesh <moystovi@g.jct.ac.il>
pkgname=freedns-updater-git
pkgver=2013.10.02.10ab161
pkgrel=1
pkgdesc="Updates freedns.afraid.org dynamic dns domains"
arch=('any')
url="http://www.github.com/InvisibleEngineer/FreeDNS-Updater"
license=('custom:UNLICENSE')
depends=('python')
makedepends=('git')
backup=('etc/freedns.conf')
changelog='CHANGELOG'
_repodir=${pkgname%-git}
source=("${_repodir}::git+git://github.com/InvisibleEngineer/FreeDNS-Updater.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"
  # Use date and hash of last commit.
  git log -1 --format=%cd-%h --date=short | sed -e 's/-/./g'
}

package() {
  cd "$srcdir/$_repodir"
  install -d "${pkgdir}/var/cache/$pkgname"
  install -D -m755 freedns.py "${pkgdir}/usr/bin/freedns"
  install -D -m644 freedns.conf "${pkgdir}/etc/freedns.conf"
  install -D -m644 UNLICENSE "${pkgdir}/usr/share/licenses/$pkgname/UNLICENSE"
}

# vim:set ts=2 sw=2 et:
