pkgname=fpc-multilib-helper
pkgver=1
pkgrel=1
pkgdesc="The Free Pascal Compiler for multilib - helper"
arch=('x86_64')
url="http://www.freepascal.org/"
license=('GPL' 'LGPL' 'custom')

source=("i386-linux-ld"
		"i386-linux-as")
md5sums=('85047325c34e31b290a95ecd0efe6316'
		'fc1a18ea36f80723759820473edaca1d')


package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 ${startdir}/i386-linux-ld ${pkgdir}/usr/bin/i386-linux-ld
  install -m755 ${startdir}/i386-linux-as ${pkgdir}/usr/bin/i386-linux-as
}
