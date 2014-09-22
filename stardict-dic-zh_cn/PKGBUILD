#Contributor:Iru Dog <mytbk920423 AT gmail.com>

pkgname=stardict-dic-zh_cn
pkgver=2.4.2
pkgrel=12
pkgdesc="Chinese dictionary for stardict"
arch=('any')
url="http://code.google.com/p/stardict-3/"
license=('GPL')
depends=(stardict)
conflicts=()

_baseurl='http://mirrors.ustc.edu.cn/fedora/linux/releases/20/Everything/i386/os/Packages/s'
source=("${_baseurl}/stardict-dic-zh_CN-${pkgver}-${pkgrel}.fc20.noarch.rpm")
md5sums=('90707a7cac9647c1ebf08142284eee53')

build() {
  true
}

package() {
  cd ${srcdir}
  mv usr/ ${pkgdir}
}
