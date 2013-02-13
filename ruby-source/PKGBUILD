# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-source
pkgver=1.9.3_p385
pkgrel=1
pkgdesc='An object-oriented language for quick and easy programming'
arch=('any')
url='http://www.ruby-lang.org/en/'
license=('BSD' 'custom')
source=("ftp://ftp.ruby-lang.org/pub/ruby/${pkgver%.*}/ruby-${pkgver//_/-}.tar.bz2")
sha256sums=('f991ee50414dc795696bad0fc5c7b0b94d93b9b38fed943326d20ce4e9dda42b')

package() {
  mkdir -p "${pkgdir}/usr/src"
  
  mv ruby-${pkgver//_/-} "${pkgdir}/usr/src"
}
