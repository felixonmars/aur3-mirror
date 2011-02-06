# Maintainer: Can Celasun <dcelasun [at] gmail.com>
pkgname=katchtv
pkgver=0.91
pkgrel=1
pkgdesc="Katch TV"
arch=('i686' 'x86_64')
url="http://irukado.org/katchtv"
license=('custom')
depends=('kdebase-workspace' 'kdebase-konsole' 'pykde')
source=('http://launchpad.net/katchtv/trunk/0.91/+download/katchtv-0.91.tar.bz2')
md5sums=('0a2ef4ed57f14cf30efd9f1da4c84360')

build() {
  mkdir $pkgdir/usr/local/KatchTV -p
  cd $srcdir/KatchTV
  mv * $pkgdir/usr/local/KatchTV
  
  mkdir -p $pkgdir/usr/bin
  ln -s $pkgdir/usr/local/KatchTV/KatchTV $pkgdir/usr/bin/KatchTV
  chmod +x $pkgdir/usr/bin/KatchTV
    
}


