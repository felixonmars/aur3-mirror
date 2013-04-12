# Mainteiner:     mmm 
pkgname=rootbeer-git
pkgver=0.2012_08_18
pkgrel=3
pkgdesc="compile and run your Java code on a (CUDA) GPU, better than bindings"
arch=('i686' 'x86_64')
url="https://code.google.com/p/gpuocelot/"
license=('MIT')
depends=('java-environment' 'cuda-toolkit' ) # also CUDA enebled GPU driver or emulation 
makedepends=('apache-ant' )
provides=('rootbeer')
install=rootbeer.install
source=('git+https://github.com/pcpratts/rootbeer1.git')
md5sums=('SKIP')

build()
{
  cd $srcdir/rootbeer1
  ant
  ./pack-rootbeer
}

package()
{
  mkdir -p $pkgdir/usr/bin
  install $srcdir/rootbeer1/Rootbeer.jar $pkgdir/usr/bin/
}
