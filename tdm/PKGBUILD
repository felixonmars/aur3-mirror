# Contributor: ilgufo <theowlnet@gmail.com>

pkgname=tdm
pkgver=0.1alpha4
pkgrel=3
pkgdesc="Tdm is a manager for tremulous demos"
arch=('i686' 'x86_64')
url="http://www.jdoe.biz/tdm"
license=('GPL')
depends=('python' 'pygtk')
source=(http://www.jdoe.biz/tdm/downloads/$pkgver/$pkgname-$pkgver.tar.bz2)

md5sums=('157e22b408665e5059a4a91b0b689d60')


build() {
  cd $startdir/src/$pkgname-$pkgver

  python setup.py install --prefix=/usr --root=$startdir/pkg

}



