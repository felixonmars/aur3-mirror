# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=faces
pkgver=0.11.7
pkgrel=1
pkgdesc="A powerful and flexible project management tool"
arch=('i686' 'x86_64')
url="http://faces.homeip.net"
license=('GPL')
depends=('ghostscript' 'poster' 'python-cheetah' 'python-matplotlib' 'python-numeric') 
source=(http://downloads.sourceforge.net/$pkgname-project/$pkgname-pm-$pkgver.tar.gz)
md5sums=('eea3cd8dc7f201ac6d745fe9d34274cd')
sha512sums=('8cee74f6068ed43946fca2b1678517b8466c197364e86b8ce8267a00230a123574b74b121868f59f1c3453ddbee8bc118d997080c310f37ea2d42eb73a71ab84')

build() {
  cd $startdir/src/$pkgname-pm-$pkgver
  python setup.py build || return 1
  python setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
