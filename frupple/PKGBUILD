# Contributor: Nathan Owe. <ndowens04 at gmail>
pkgname=frupple
pkgver=0.1.0dev
pkgrel=1
pkgdesc="CLI flickr uploader"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/Frupple/0.1.0dev"
source=(http://pypi.python.org/packages/source/F/Frupple/Frupple-$pkgver.tar.gz 'LICENSE')
license=('MIT')
md5sums=('278eda26cab89b9723996a8bf3052084' \
	 '838c366f69b72c5df05c96dff79b35f2')
depends=('python' 'setuptools' 'flickrapi')
options=(!emptydirs)

build() {
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cd $srcdir/Frupple-${pkgver}
  python setup.py build
  python setup.py install --root=${pkgdir}/ --install-scripts=/usr/bin

  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/frupple/
  
}


