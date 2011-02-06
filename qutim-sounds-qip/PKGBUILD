# Contributor: Ivan Astafyev (asivan) <ivan.astafyev (at) gmail.com>
pkgname=qutim-sounds-qip
pkgver=0
pkgrel=1
pkgdesc="QIP sounds for Qutim."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('custom')
depends=('qutim')
source=("http://www.qutim.org/uploads/Products/product_12/Sounds_QIP.zip")
md5sums=('f7aa1e6018cc645182ddee3eba67b790')

_origname="Sounds_QIP"
_shortname="qip"

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/qutim/sounds/$_shortname
  install -m644 $_origname/* \
                $pkgdir/usr/share/qutim/sounds/$_shortname
} 
