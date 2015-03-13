# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Sandro Munda <munda.sandro@gmail.com>

_pkgname=baboon
pkgname=baboon-git
pkgver=0.1.0.r34.gc86586a
pkgrel=1
pkgdesc="Detect merge conflicts in realtime."
arch=(any)
url="http://baboon-project.org"
license=('MIT')
depends=('python2-sleekxmpp-git-devel' 'python2-dnspython-git'
         'python2-watchdog-git' 'python2-termcolor')
makedepends=(git)
options=(!emptydirs)
source=(git://github.com/SeyZ/baboon.git)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:}
