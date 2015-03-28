# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Dan Serban

pkgname=gecrit
pkgver=2.8.4
pkgrel=2
pkgdesc="Fast, lightweight Python IDE intended for beginners, with common features and a focus on simplicity and ease of use."
arch=('any')
url="http://sourceforge.net/projects/gecrit/"
license=('GPL3')
depends=('python2-pyenchant' 'wxpython2.8')
source=("http://downloads.sourceforge.net/project/$pkgname/SOURCE/$pkgname-$pkgver.tar.gz"
               'gecrit.desktop')
md5sums=('b672ef0830817b6c261fa73904bfba05'
         '1bcd04a80bd5ea4dc13f11f61700134b')

prepare() {
  cd $pkgname-$pkgver
  sed -i gecrit -e 's#python#python2#;s#/usr/share#/usr/lib/python2.7/site-packages#'

  # Use WxPython 2.8
  sed -i '21iwxversion.select("2.8")' gEcrit.py
  sed -i '21iimport wxversion' gEcrit.py 
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir

  # Desktop icon
  install -Dm644 icons/gEcrit.png $pkgdir/usr/share/pixmaps/gecrit.png
  install -Dm644 ../gecrit.desktop $pkgdir/usr/share/applications/gecrit.desktop
}