# Contributor: v01d <phreakuencies@gmail.com>
pkgname=rbot
pkgver=0.9.15
pkgrel=1
pkgdesc="IRC Bot written in Ruby, with modular architecture to allow developement of plug-ins"
arch=(i686 x86_64)
url="http://ruby-rbot.org/"
depends=('ruby-bdb')
source=("http://ruby-rbot.org/download/rbot-${pkgver}.tgz")
license=(custom)
md5sums=('5f1cc9f09c9e47ae5224a88cd8fd1158')

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  ## config & install rbot
  ./setup.rb config --prefix=/usr
  ./setup.rb install --prefix=$startdir/pkg
  
  ## copy custom license (appears to be derived from MIT)
  install -m 644 -o root -g root -D COPYING $startdir/pkg/usr/share/licenses/${pkgname}/COPYING
}

