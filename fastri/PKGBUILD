# Contributor: Vladimir Chizhov <jagoterr@gmail.com>

pkgname=fastri
pkgver=0.3.1
pkgrel=1
pkgdesc="faster, smarter RI docs for Ruby, DRb-enabled"
url="http://eigenclass.org/hiki.rb?fastri"
license="ruby"
arch=(i686 x86_64)
depends=('ruby')
#install='fastri.install'
source=(http://eigenclass.org/static/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('3a7d0a64b1c8e230a34ef7b4bad30dbe')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby setup.rb config --prefix=/usr
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg
}

