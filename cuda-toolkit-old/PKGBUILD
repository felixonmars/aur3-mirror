# Maintainer: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: Lawrence Lee <valheru AT facticius DOT net>
# Contributor: Ismael Barros Barros <razielmine@gmail.com>
pkgname=cuda-toolkit-old
pkgver=2.2
pkgrel=4
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')

url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
provides=('cuda' 'cuda-toolkit')

if [ "$CARCH" = "i686" ]; then
   ARCH=x86      
   source=(http://developer.download.nvidia.com/compute/cuda/2_2/toolkit/cudatoolkit_2.2_linux_32_suse11.1.run install-linux.pl.ununinstall.patch)
   depends=('gcc-libs' 'nvidia>=185.18.14.-1' 'zlib')
   md5sums=('d23cdec72cf18602cdb558b55578da1a' 'a6ecb757dc97696bbc2ef31930ba519f')
fi

if [ "$CARCH" = "x86_64" ]; then
   ARCH=x86_64
   source=(http://developer.download.nvidia.com/compute/cuda/2_2/toolkit/cudatoolkit_2.2_linux_64_suse11.1.run install-linux.pl.ununinstall.patch)
   depends=('gcc-libs' 'nvidia>=185.18.14.-1' 'zlib' 'lib32-pcre')
   md5sums=('db982d755516b8952475c92cb243e5cb' 'a6ecb757dc97696bbc2ef31930ba519f')
fi

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/share/cuda-prof
  mkdir -p $pkgdir/usr/share/doc/cuda-toolkit
  mkdir -p $pkgdir/usr/share/doc/cuda-toolkit/cudaprof
  mkdir -p $pkgdir/usr/share/doc/cuda-toolkit/html
  mkdir -p $pkgdir/usr/share/licenses/cuda-toolkit
  cd $srcdir
  [ "$CARCH" = "i686" ] &&  sh cudatoolkit_2.2_linux_32_suse11.1.run --noexec --keep
  [ "$CARCH" = "x86_64" ] &&  sh cudatoolkit_2.2_linux_64_suse11.1.run --noexec --keep
  patch -p0 -i install-linux.pl.ununinstall.patch || return 1
  cd pkg
  # these files conflict with linux man pages
  mv $srcdir/pkg/man/man3/major.3 $srcdir/pkg/man/man3/cuda-major.3 
  mv $srcdir/pkg/man/man3/minor.3 $srcdir/pkg/man/man3/cuda-minor.3 
  # uninstall routine causes problems, we will pacman handle uninstallation instead
  ./install-linux.pl --prefix=$startdir/pkg/usr &> /dev/null
  install -m 755 $pkgdir/usr/open64/bin/* $pkgdir/usr/bin
  install -m 755 $pkgdir/usr/open64/lib/* $pkgdir/usr/lib
  mv $pkgdir/usr/doc/EULA.txt $pkgdir/usr/share/licenses/cuda-toolkit/
  mv $pkgdir/usr/doc/* $pkgdir/usr/share/doc/cuda-toolkit
  mv $pkgdir/usr/man $pkgdir/usr/share/man
  mv $pkgdir/usr/cudaprof/*.txt $pkgdir/usr/share/licenses/cuda-toolkit
  mv $pkgdir/usr/cudaprof/doc/* $pkgdir/usr/share/doc/cuda-toolkit/cudaprof
  rmdir $pkgdir/usr/cudaprof/doc
  mv $pkgdir/usr/cudaprof/* $pkgdir/usr/share/cuda-prof
  rm -rf $pkgdir/usr/doc
  rm -rf $pkgdir/usr/man
  rm -rf $pkgdir/usr/open64
  rm -rf $pkgdir/usr/src
  rm -rf $pkgdir/usr/cudaprof
}
