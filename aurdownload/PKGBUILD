#Maintainer: nixalot <nixalot at nixalot dot com>
pkgname=aurdownload
pkgver=1.0
pkgrel=1
pkgdesc='Retrieve and extract PKGBUILDS from the AUR'
arch=(any)
license=(GPL3)
url="https://github.com/nixalot/$pkgname"
depends=('python' 'python-requests')
source=(
  ${pkgname}_${pkgver}.zip::https://github.com/nixalot/${pkgname}/archive/master.zip
)

md5sums=('d4d877efeb3482e0efb7c7b114d2021c')
sha1sums=('2f4938d896f503ed521b69916c6c6a42d1ec38a6')
sha256sums=('9c44448ba5a5fdefda8b4a6ec3e4ae8d79b6d5de1a0ea30f82b4001876d3fb1d')
sha384sums=('ab44d8dc8aaeb3c5cad3fb573ab79bf64ce2a754820be755c6ecafa1251d5a9e1224854b0d109a372dbb684b9f0ad3e9')
sha512sums=('b2bea526dadc32f8fe326f1b392f91cb1dc8061cb99e45c002f1ef1b66f962efdb4981cf623acf32ae736f1f615b0810ed7433c4d08809463d2f916deebda4f3')

package ()
{
  install -D -m755 "$srcdir/$pkgname-master/${pkgname}.py" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
