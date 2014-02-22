# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

pkgname="pinguino-sdcc-pic16"
bitbucketaccount="YeisonEng"

pkgver="3.3.2"
pkgrel="0"
pkgdesc="SDCC-pic16 compilers for pinguino-ide"
arch=("any")
url="http://www.pinguino.cc/"
license=("GPL")

provides=("sdcc=3.3.2")

source=("$pkgname::https://bitbucket.org/$bitbucketaccount/pinguino-compilers/downloads/$pkgname.zip")
md5sums=('85f0e9bae18e0424c3b9850d534c9346')

package() {

  cd ${startdir}
  install -m755 -d ${pkgdir}/usr

  #moving sdcc
  mv -vf ${srcdir}/${pkgname}/* ${pkgdir}/usr/ 

}
