# Contributor: Vasiliy Kosenko aka vkos <vkosvk at ya dot ru>

pkgname=youvideor
pkgver=0.1
pkgrel=1
pkgdesc="Qt4 program to watch youtube video"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/YouVideor?content=116337"
license=('GPL')
depends=('qt' 'openssl')
makedepends=('cmake')
source=('http://sunet.dl.sourceforge.net/project/$pkgname/YouVideor $pkgver/YouVideor-'$pkgver'.tar.bz2')
md5sums=('18af85dc43f8edc90dcc0cf709c1a46b')

build() {
  cd $srcdir/YouVideor-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
