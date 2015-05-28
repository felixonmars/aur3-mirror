# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pgcli
pkgver=0.17.0
pkgrel=1
pkgdesc="a command line interface for Postgres with auto-completion and syntax highlighting"
url="http://pgcli.com/"
arch=(any)
license=('BSD')
depends=('python' 'python-sqlparse' 'python-psycopg2' 'python-click' 'python-prompt-toolkit')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/p/pgcli/$pkgname-$pkgver.tar.gz")
md5sums=('abf08a722ec32aa4734ceb9f6f7fbcd3')

package() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root=$pkgdir/ --optimize=1
    echo "#!/usr/bin/bash" > $pkgdir/usr/bin/pgcli
    echo "python -c 'import pgcli.main; pgcli.main.cli()' \"\$@\"" >> $pkgdir/usr/bin/pgcli
}
