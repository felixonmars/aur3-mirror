# Contributor: dibblethewrecker dibblethewrecker.at.gmail.com

pkgname=thuban
_pkgname=Thuban
pkgver=1.2.2
pkgrel=1
pkgdesc='Interactive Geographic Data Viewer with support for vector & raster data'
arch=('i686' 'x86_64')
url='http://thuban.intevation.org/'
license=('GPL')
depends=('wxpython' 'gdal' 'python-pysqlite-legacy')
optdepends=('python-psycopg2: for postgis connections')
source=("http://wald.intevation.org/frs/download.php/620/$_pkgname-$pkgver.tar.bz2" 
        'thuban.desktop')
md5sums=('964247946e04005392213d5c6bdb6ab3'
         '25b3d0a5a997c4f102bc9bed3853cdda')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/thuban.desktop" \
      "$pkgdir/usr/share/applications/thuban.desktop"
}
