# Maintainer: Jakob Gruber (jakob dot gruber at kabelnet dot at)

_pkgname="mkwvconf" 
pkgname="$_pkgname-git"
pkgver=0.1
pkgdesc="Automatically generate a wvdial configuration for mobile broadband devices."
pkgrel=1
arch=('any')
url="http://github.com/schuay/mkwvconf"
license=('GPL')
depends=('mobile-broadband-provider-info-git' 'python' 'pyxml')
makedepends=('git')

build() {

  #clean source directory
  rm -rf $srcdir/*

  #git checkout
  cd $srcdir
  git clone git://github.com/schuay/mkwvconf.git
  cd $srcdir/$_pkgname

  #install
  mkdir -p "$pkgdir/usr/bin/"
  cp mkwvconf.py "$pkgdir/usr/bin/mkwvconf"
}

