# Contributer: Benjamin Andresen <benny@klapmuetz.org>
# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-fusefs
pkgver=0.7.0
pkgrel=1
pkgdesc="Ruby fuse bindings -- create fuse filesystems"
url="http://github.com/duairc/fusefs"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ruby' 'fuse')
source=("http://rubygems.org/downloads/fusefs-${pkgver}.gem" ruby-fusefs.license)
md5sums=('3393ddeea8d9f2b7438f2a5fcca4d7c5' '9e08419e1edfadbe87a7c2643c1320d9')
noextract=("fusefs-${pkgver}.gem")

build() {
  cd "$srcdir/"
  
  gem install --ignore-dependencies \
    -i "${pkgdir}/$(gem environment gemdir)" "fusefs-${pkgver}.gem"

  install -D -m 644 ruby-fusefs.license $pkgdir/usr/share/licenses/$pkgname/COPYING
}
