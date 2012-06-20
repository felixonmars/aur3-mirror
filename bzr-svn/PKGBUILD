# Contributor: Mildred <silkensedai@online.fr>
# Adopted by Gour <gour@mail.inet.hr>
# Adopted by medlefsen <matt.edlefsen@gmail.com>
# Adopted by pnutzh4x0r <pnutzh4x0r@gmail.com>
# Adopted by L42y <423300@gmail.com>
# Adopted by Atomisirsi <atomisirsi@gsklan.de>

pkgname=bzr-svn
pkgver=1.2.2
pkgrel=1
pkgdesc="subversion foreign branch support for bazaar"
arch=('i686' 'x86_64')
url="http://bazaar-vcs.org/BzrForeignBranches/Subversion"
license=('GPL')
depends=('bzr>=2.5' 'tdb' 'subvertpy>=0.8.0')
source=("http://launchpad.net/${pkgname}/1.2/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=("6c9cb5ad64fd001f2dced927758e533d")

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir
}
