# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Iven Hsu <ivenvd#gmail.com>

_pkgname=Yaner
pkgname=yaner-git
pkgver=0.0.2.483.g8d6efce
pkgrel=1
pkgdesc="GTK+ interface for aria2 download mananger."
arch=(any)
url="http://iven.github.com/Yaner"
license=('GPL3')
depends=('python-chardet' 'python-sqlalchemy' 'python-gobject' 'libnotify' 'dconf' 'xdg-utils' 'aria2')
makedepends=('git' 'python-distutils-extra')
provides=('yaner')
conflicts=('yaner')
options=(!emptydirs)
install=yaner.install
source=("git://github.com/iven/Yaner.git#branch=develop")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed -e 's|-|.|g' -e 's|_|.|g' -e 's|YANER.||'
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
