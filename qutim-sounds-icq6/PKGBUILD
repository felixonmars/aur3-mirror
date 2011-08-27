# Contributor: Ivan Astafyev (asivan) <ivan.astafyev (at) gmail.com>
pkgname=qutim-sounds-icq6
pkgver=0
pkgrel=1
pkgdesc="ICQ6 sounds for Qutim."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('custom')
depends=('qutim')
optdepends=('mpg123: play sounds (all files are mp3-encoded)')
source=("http://www.qutim.org/uploads/Products/product_11/icq6.zip")
md5sums=('81fad73d59b12212fb1cfd518f78bcb4')

_origname="icq6"

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/qutim/sounds/$_origname
  install -m644 $_origname/* \
                $pkgdir/usr/share/qutim/sounds/$_origname
} 
