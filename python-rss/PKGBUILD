# Maintainer: Baptiste Jonglez <zerstorer@free.fr>
pkgname=python-rss
pkgver=0.1
pkgrel=1
pkgdesc="A easy-to-use python3 library to generate RSS 2.0 compliant feed"
arch=('any')
url="http://znasibov.info/blog/post/rss-py.html"
license=('GPL')
depends=('python' 'pyxml' 'python-distribute') #TODO
source=("http://znasibov.info/media/data/files/rss.py"
    "setup.py")
md5sums=('e00cc4e486ae473ef815c6fc168d8d31'
         '498c1f1fca45d37689a3c192ccef99d9')

build() {
  cd "$srcdir"
  mkdir rss
  mv rss.py rss/
}

package() {
  cd "$srcdir"

  python setup.py install --prefix=/usr --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
