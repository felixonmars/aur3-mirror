# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

_pkgname=github-notifier
pkgname=github-notifier-git
pkgver=61.e03c01d
pkgrel=1
pkgdesc="Github updates notifier for Linux."
arch=('any')
url="http://github.com/abiczo/github-notifier"
license=(unknown)
depends=('python2-feedparser' 'python2-simplejson' 'pygtk' 'python2-notify')
makedepends=('git' 'python2-distribute')
source=('git://github.com/abiczo/github-notifier.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir"
  #install -Dm755 githubnotifier.py "$pkgdir/usr/bin/githubnotifier"
}

# vim:set ts=2 sw=2 et:
