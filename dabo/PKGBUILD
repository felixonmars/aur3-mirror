# Contributor: tuxlifan
# Contributor: Jason Pierce <`echo 'moc tod liamg ta nosaj tod ecreip' | rev`>
# Contributor: hauptmech 

pkgname=dabo
pkgver=0.9.14
pkgrel=1
pkgdesc="3-tier Application Framework in Python"
arch=('any')
url="http://dabodev.com/"
license=('MIT')
depends=('wxpython')
makedepends=('python2-distribute')
optdepends=('python-reportlab: Reporting features'
'python-opengl: Needed for dGLWindow class'
'python-pysqlite: SQLite backend'
'mysql-python: MySQL backend'
'python-kinterbasdb: Firebird backend'
'python-psycopg2: PostgreSQL backend')
backup=()
options=()
install=
source=(https://codeload.github.com/dabodev/dabo/tar.gz/v${pkgver}
patch_wx2.9::http://trac.dabodev.com/attachment/ticket/1436/0001-Fixed-wx-C-assertion-in-menu-item-creation-on-wx2.9..patch?format=raw
)

prepare() {
cd "$srcdir/$pkgname-$pkgver"

patch -p1 < ../patch_wx2.9

find -regex '.*\.py\(\.txt\)?' -exec sed -i '1s/env python$/env python2/' {} \;
}

package() {
cd "$srcdir/$pkgname-$pkgver"

mkdir -p $pkgdir/usr/share/licenses/dabo


yes | python2 setup.py install --root="$pkgdir" --install-purelib="/usr/lib/python2.7/site-packages/" \
--install-platlib="/usr/lib/python2.7/site-packages/" --install-data="/usr/lib/python2.7/site-packages/"

install -m644 LICENSE.TXT $pkgdir/usr/share/licenses/dabo
install -m755 -d $pkgdir/opt/dabo
cp -R demo ide $pkgdir/opt/dabo/
}

md5sums=('74a5abeba74bd8604dee421aa31c43dc'
         '879410c633f2d546d33d9f4faf5ed291')
