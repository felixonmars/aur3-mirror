# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Iven Hsu <ivenvd#gmail.com>

pkgname=yaner
pkgver=0.5.3
_pkgdir=Yaner-YANER_${pkgver//./_}
pkgrel=1
pkgdesc="GTK+ interface for aria2 download mananger."
arch=(any)
url="http://iven.github.com/Yaner"
license=('GPL3')
depends=('python-chardet' 'python-sqlalchemy' 'python-gobject' 'libnotify' 'dconf' 'xdg-utils' 'aria2')
makedepends=('python-distutils-extra')
conflicts=('yaner-git')
options=(!emptydirs)
install=yaner.install
source=(https://github.com/iven/Yaner/archive/YANER_${pkgver//./_}.tar.gz)
md5sums=('e18aadc4b4207b488b819e33b90fdb20')


package() {
  cd "$srcdir/$_pkgdir"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
