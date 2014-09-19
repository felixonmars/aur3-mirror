# Contributor: Ecmel Ercan <ecmel.ercan@gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

pkgname=ss
pkgver=1.07
pkgrel=1
pkgdesc="batch spreadsheet for C programmers"
url="http://fog.misty.com/perry/ss/ref.html"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
makedepends=('groff')
optdepends=('gcc: for macros' 
            'gawk: for html export' 
            'gnuplot: for plotting' 
            'netpbm: for image export')
source=("http://fog.misty.com/perry/ss/${pkgname}-${pkgver}.tar.gz")
md5sums=('2dcb5252ad4af6e0f1077a4fbe68b5de')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's:SS="/usr/local/bin/ss":SS="/usr/bin/ss":' SS
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # we cannot provide ss as /usr/bin/ss, because then it conflicts with the package iproute2
  install -Dm755 ss "$pkgdir/usr/bin/SS"
  
  cd "${srcdir}/${pkgname}-${pkgver}/doc"
  install -d "$pkgdir/usr/share/doc/SS"
  cp -rf *.{ss,html,gif,txt} "$pkgdir/usr/share/doc/SS/"
  install -Dm644 SS.1 "$pkgdir/usr/share/man/man1/SS.1"
}
