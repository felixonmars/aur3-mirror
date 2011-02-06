# Contributor: Piotr Beling <qwak82@gmail.com>
pkgname=tesla-pylons-elixir
pkgver=0.2.5
pkgrel=2
pkgdesc="Paster template for creating Pylons applications using SQLAlchemy/Elixir ORM. Adds some simple database paster commands."
url="http://code.google.com/p/tesla-pylons-elixir/"
license=('MIT')
arch=(x86_64 i686)
depends=('pylons' 'python-elixir' 'python-migrate' 'python-authkit' 'python-sacontext')
source=(http://tesla-pylons-elixir.googlecode.com/files/tesla-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/$pkgname
  python setup.py install --root=$startdir/pkg
}
md5sums=('ef85b9b072fb487a2a81c1808159410c')
