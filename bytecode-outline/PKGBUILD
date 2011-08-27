# Contributor: Dr.XaoS <dr.xaos@mail.ru>
pkgname=bytecode-outline
pkgver=2.2.6
pkgrel=1
pkgdesc="Eclipse Bytecode Outline plugin shows disassembled bytecode of current java editor or class file"
arch=(i686 x86_64)
url="http://andrei.gmxhome.de/bytecode/index.html"
license="GPL"
groups=eclipse
depends=('eclipse' 'jre')
source=(http://skin4eclipse.googlecode.com/files/de.loskutov.BytecodeOutline_$pkgver.jar)
noextract=(de.loskutov.BytecodeOutline_$pkgver.jar)
md5sums=('bf3b0e0d49c8aaed758bf295218cd0f5')


build() {
  mkdir -p $startdir/pkg/usr/share/eclipse/plugins
  cp $startdir/src/de.loskutov.BytecodeOutline_$pkgver.jar $startdir/pkg/usr/share/eclipse/plugins/de.loskutov.BytecodeOutline_$pkgver.jar
  return 0;
}
