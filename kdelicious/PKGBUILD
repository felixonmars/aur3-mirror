# Contributor: zeb <sebstrand@gmail.com>
pkgname=kdelicious
pkgver=3.2.1
pkgrel=2
pkgdesc="A Konqueror service menu interface for del.icio.us"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/KDelicious?content=72038"
license=('GPL')
depends=('python>=2.3.5' 'pykde')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c8cb51fb61520a57122069920a8012a3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -ie 's/sys\.path\.append("\.\/lib\/")/sys.path.append(".\/lib\/pykdeextensions\/")/g' setup.py
  python setup.py install --root=$startdir/pkg || return 1
}
