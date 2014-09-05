# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=luaprompt-jit
pkgver=0.3.1
pkgrel=1
pkgdesc="luaprompt compiled with luajit and history support"
arch=('i686' 'x86_64')
url="https://github.com/dpapavas/luaprompt" 
depends=('luajit' 'readline')
makedepends=('gcc')
license=('custom')
source=("https://github.com/dpapavas/luaprompt/archive/v$pkgver.tar.gz"
        "luaprompt-luajit.diff"
        "LICENSE")
md5sums=("a8cac6d3e31863467b93f70b39b66b4a"
         "766783193e383472d1bb081a58fff4a1"
         "ef72cd82b7ba326525b1d75b6d5076f3")

prepare() {
  cd "${srcdir}/luaprompt-$pkgver"
  patch -uNp1 -i ../luaprompt-luajit.diff || return 1
}

build() { 
  cd "$srcdir/luaprompt-$pkgver"
  make
}

package() {
  cd "$srcdir/luaprompt-$pkgver"
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  cp luap ${pkgdir}/usr/bin
  cp ${startdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
