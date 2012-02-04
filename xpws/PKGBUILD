# Contributor: JD Horelick <jdhore1@gmail.com>
pkgname=xpws
pkgver=0.1
pkgrel=1
pkgdesc="X Personal Web Server"
arch=('i686' 'x86_64')
url="http://adam.kruszewski.name/"
license=('GPL')
depends=('gnome-python-extras' 'twisted')
source=(http://adam.kruszewski.name/ubuntu/pool/main/x/$pkgname/xpws_$pkgver.tar.gz)
md5sums=(dd1fccb1cc12c4e4b390c77342c715aa)


build() {
  cd $startdir/src/$pkgname
  python setup.py install
}


