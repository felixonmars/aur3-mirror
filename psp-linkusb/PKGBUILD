# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-linkusb
pkgver=0
pkgrel=1
pkgdesc="A general purpose loader tool (psp)"
arch=(any)
url="https://github.com/pspdev/psplinksusb"
license=('GPL')
groups=('psp')
depends=('zlib')
makedepends=('psp-gcc')
conflicts=('psp-sdk-base')
provides=('psp-sdk-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://github.com/pspdev/psplinkusb.git")
md5sums=('SKIP')

prepare()
{
  cd "$srcdir/psplinkusb"
}

build()
{
  cd "$srcdir/psplinkusb"
  make release
}

package()
{
  cd "$srcdir/psplinkusb"
  install -d "$pkgdir"/usr/psp
  cp -r release "$pkgdir"/usr/psp/linkusb
}

