# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=mpy-svn-stats
pkgver=0.4.1
pkgrel=1
pkgdesc='Log analysis tool for Subversion'
arch=('any')
url='http://mpy-svn-stats.berlios.de/'
depends=('pyxml')
license=('GPL')
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tgz")
md5sums=('623aa774bfda562fe2d18a54bbeb8d8f')

build() {
  cd $pkgname-$pkgver
  sed -i 1c\ "#!/usr/bin/python -O" msvnstats.py
  install -D -m0755 msvnstats.py $pkgdir/usr/bin/$pkgname
}

