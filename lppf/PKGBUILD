# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>

pkgname=lppf
pkgver=0.1_rc1
pkgrel=1
pkgdesc="PPF patch file applyer"
url="http://sourceforge.net/projects/lppf/"
license="GPL2"
arch=('i686' 'x86_64')
source=(http://sourceforge.net/projects/lppf/files/lppf-0.1_rc1/lppf-0.1_rc1/lppf-0.1-rc1.tar.gz)

build() {
  cd "${srcdir}/${pkgname}-0.1-rc1"

  make
}

package() {
  cd "${srcdir}/${pkgname}-0.1-rc1"

  mkdir -p "${pkgdir}/usr/bin"
  cp lppf "${pkgdir}/usr/bin/"
}
md5sums=('f85b14efb64378fe016a104f09c36e6d')
