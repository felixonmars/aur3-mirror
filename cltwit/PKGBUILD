# Maintainer: Jérôme Launay <jerome@projet-libre.org> 
pkgname=cltwit
pkgver=0.6
pkgrel=1
pkgdesc="Command line twitter utility written in Python."
arch=(any)
url="http://forge.projet-libre.org/projects/cltwit/wiki"
license=('WTFPL')
depends=('python2' 'python2-distribute' 
 'python2-tweepy' 'python2-reportlab' 'python2-dateutil'
)
optdepends=()
conflicts=()
source=(http://forge.projet-libre.org/attachments/download/11/$pkgname-$pkgver.tar.gz)
md5sums=('84de2cb4d19e302f09ee92c00ddb219e')

build() {
  cd $srcdir/$pkgname-${pkgver//_/-}
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
