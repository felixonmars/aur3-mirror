# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Corrado 'bardo' Primier <corrado.primier@mail.polimi.it>

pkgname=burn
pkgver=0.4.4
pkgrel=1
pkgdesc="A simple Python script for burning CDs and DVDs"
arch=('any')
url="http://www.bigpaul.org/burn/"
license=('GPL')
depends=('cdrdao' 'cdrkit' 'pyao' 'pymad' 'python-eyed3' 'pyvorbis')
makedepends=('setuptools')
optdepends=('mpg321: external mp3 decoding'
            'vorbis-tools: external ogg decoding')
backup=(etc/$pkgname.conf)
source=(http://www.bigpaul.org/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('89526cac818f216eb93407b47d05f971')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '$s,python,&2,' bin/$pkgname{,-configure}
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm755 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
}
