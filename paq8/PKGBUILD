# Maintainer: ardemiranda <ardemiranda@gmail.com>

pkgname=paq8
pkgver=l
pkgrel=1
pkgdesc="PAQ8 series of archivers, resurrected by new maintainers"
url="http://cs.fit.edu/~mmahoney/compression/#paq"
makedepends=('nasm')
arch=('x86_64' 'i686')
license=('GPL')
source=("http://cs.fit.edu/~mmahoney/compression/${pkgname}${pkgver}.zip"
        "paq7asm.asm")
md5sums=('c57b6a1915b86d42f820e7f249b0ccf6'
         '36b02f2ed3eca8edc84be6f5885026dc')

build()
{
  if [ `uname -m` == "x86_64" ]; then
    _asmarch="elf64"
  else
    _asmarch="elf"
  fi
  cd $startdir/src
  #nasm -f ${_asmarch} paq7asmsse.asm || 1
  g++ ${pkgname}${pkgver}.cpp -DUNIX -DNOASM $CFLAGS -o ${pkgname}${pkgver} || 1
  install -D -m 755 $startdir/src/${pkgname}${pkgver} ${startdir}/pkg/usr/bin/${pkgname}${pkgver}
}
