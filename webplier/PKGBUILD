
pkgname=webplier
name=Webplier
pkgver=1.1.0
rel=1
pkgrel=1
pkgdesc='Create web apps for all your important, application-like websites.'
arch=(any)
license=(GPL)
url=("http://webplier.com")
depends=('python2>=2.7')
optdepends=()
conflicts=()
source=("http://webplier.com/download/$name-$pkgver.tar.gz")
md5sums=("c9b184beea46a63af2f629f7144bfd76")
#install="$pkgname.install"

package()
{
  cd "$srcdir/$name-${pkgver}"
  
  python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
  #make INSTALL_ROOT=${pkgdir}
  
}

