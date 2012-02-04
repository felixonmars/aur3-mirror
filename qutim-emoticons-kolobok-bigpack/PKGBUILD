# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
# Previous contributors: atommix aka Aleks Lifey <Aleks.Lifey@gmail.com>
pkgname=qutim-emoticons-kolobok-bigpack
pkgver=0
pkgrel=2
pkgdesc="Kolobok big pack emoticons for Qutim."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('custom')
depends=('qutim')
source=("http://www.qutim.org/uploads/Products/product_8/BigPackColob.zip")
md5sums=('017ca988dbd3b9b63a65fac541beb60d')

_origname="BigPackColob"

build() {
  cd $srcdir/$_origname
  install -d $pkgdir/usr/share/qutim/emoticons/Kolobok_Big_Pack
  install -m644 $_origname/* \
                $pkgdir/usr/share/qutim/emoticons/Kolobok_Big_Pack/
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 Copyright* \
                $pkgdir/usr/share/licenses/$pkgname/
} 
