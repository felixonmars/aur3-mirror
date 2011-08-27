pkgname=kanola
pkgver=0.1
pkgrel=1
pkgdesc="A MPD client for KDE"
depends=('pykde' 'mpd' 'python-mpdclient2')
source=(http://dadexter.googlepages.com/$pkgname-$pkgver.tar.gz)
url="http://dadexter.googlepages.com/kanola"
md5sums=('13d923d97445012bbe5e8bdf181af90a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/python setup.py install --prefix $startdir/pkg/usr
  cd $startdir/pkg
  find . -iname 'mpdclient2.py' -exec rm {} \;
}
