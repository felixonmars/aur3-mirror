# Contributor: William Rea <sillywilly@gmail.com>
pkgname=prewikka
pkgver=0.9.7.1
pkgrel=1
pkgdesc="Prelude Management Console"
url="http://www.prelude-ids.org"
backup=('etc/prewikka/prewikka.conf')
depends=('python-cheetah' 'libpreludedb')
source=(http://www.prelude-ids.org/download/releases/prewikka-$pkgver.tar.gz)
install=$pkgname.install
md5sums=('9870683231b3b76651d48b7fec76e3eb')

build() {
  cd $startdir/src/prewikka-$pkgver
  python setup.py install --root=$startdir/pkg  
}
