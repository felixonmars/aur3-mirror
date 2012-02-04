# Contributor: Vladimir Chizhov <jagoterr@gmail.com>

pkgname=rcodetools
pkgver=0.8.1.0
pkgrel=1
pkgdesc="collection of Ruby code manipulation tools"
url="http://eigenclass.org/hiki.rb?rcodetools"
license="ruby"
arch=(i686 x86_64)
depends=('ruby')
#install='rcodetools.install'
source=(http://eigenclass.org/static/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('fce0ff81b27f0859cb18ca9d2215c1e4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby setup.rb config --prefix=/usr
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg
}

