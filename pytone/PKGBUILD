# Maintainer: David J. Haines <djhaines at gmx dot com>
# Contributor: TDY <tdy@gmx.com>

pkgname=pytone
pkgver=3.0.3
pkgrel=2
pkgdesc="An advanced music jukebox with a console interface"
arch=('i686' 'x86_64')
url="http://www.luga.de/pytone/"
license=('GPL')
depends=('mutagen' 'pyao' 'pymad' 'python2-pysqlite-legacy' 'pyvorbis')
optdepends=('python-xmms>=2.00: external xmms support'
            'mpg123: external mpg123 support'
            'mpg321: external mpg321 support')
backup=('etc/pytonerc')
source=(http://www.luga.de/pytone/download/PyTone-$pkgver.tar.gz)
md5sums=('6bac77054efd47672f97b4f022a1d073')

prepare() {
    cd "$srcdir/PyTone-$pkgver"
    sed -i 's#src#/usr/lib/python2.7/site-packages/pytone#' pytone{,ctl}
    sed -i '2s/^python/python2/' pytone{,ctl}
    sed -i '1s/python/python2/' setup.py src/{pytone{,ctl},profile}.py
}

build() {
  cd "$srcdir/PyTone-$pkgver"
  python2 setup.py build_ext -i || return 1
}

package() {
  cd "$srcdir/PyTone-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 conf/pytonerc "$pkgdir/etc/pytonerc"
  install -Dm644 README "$pkgdir/usr/share/doc/pytone/README"
}
