# $Id: PKGBUILD 69719 2012-04-23 02:56:20Z svenstaro $
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=cuda5.5
pkgver=5.5.22
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('x86_64' 'i686')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=('gcc-libs' 'opencl-nvidia')
optdepends=('gdb: for cuda-gdb')
if [ "$CARCH" == "x86_64" ]; then
	getArch=64
else
	getArch=32
fi
options=(!strip)
md5sums=($([[ "$CARCH" == "x86_64" ]] && echo '7bb06908bdf33eac0f8426821640c2fb' || echo 'c87349c9b87765c5c9f72e4fdb5c0276')
         'f386cc9d469cb7e8648ba69f95951f77'
         '895292148f9273285d8ae4dfdf3906f0')
install=cuda-5.5.install
source=(http://developer.download.nvidia.com/compute/cuda/5_5/rel/installers/cuda_${pkgver}_linux_${getArch}.run
        cuda-5.5.sh
        cuda-5.5.conf)

package() {
  sh cuda_${pkgver}_linux_${getArch}.run -extract=$srcdir
  ./cuda-linux*-rel-${pkgver}*.run -prefix=$pkgdir/opt/cuda-5.5 -noprompt
  ./cuda-samples-linux-${pkgver}*.run -cudaprefix=$pkgdir/opt/cuda-5.5 -prefix=$pkgdir/opt/cuda-5.5/samples -noprompt

  # Now, let the hacks begin!

  # allow newer gcc to work
  # NOTE: We don't need these currently, but we might again! :D
  #sed -i "/unsupported GNU/d" $pkgdir/opt/cuda-5.5/include/host_config.h
  #sed -i "1 i #define __STRICT_ANSI__" $pkgdir/opt/cuda-5.5/include/cuda_runtime.h
  #echo "#undef _GLIBCXX_ATOMIC_BUILTINS" >> $pkgdir/opt/cuda-5.5/include/cuda_runtime.h
  #echo "#define _GLIBCXX_GTHREAD_USE_WEAK 0" >> $pkgdir/opt/cuda-5.5/include/cuda_runtime.h

  # fix nvidia path fuckup
  #sed -i "s|/build/pkg/cuda||g" $pkgdir/opt/cuda-5.5/bin/nvvp $pkgdir/opt/cuda-5.5/bin/nsight

  install -Dm755 $srcdir/cuda-5.5.sh $pkgdir/etc/profile.d/cuda-5.5.sh
  install -Dm644 $srcdir/cuda-5.5.conf $pkgdir/etc/ld.so.conf.d/cuda-5.5.conf

  # correct cuda path in samples
  cd $pkgdir/opt/cuda-5.5/samples
  find . -name Makefile | xargs sed -i "s|$pkgdir/opt/cuda-5.5|/opt/cuda-5.5|g"

  # make cuda-gdk work
  #mkdir -p $pkgdir/usr/lib
  #cd $pkgdir/usr/lib
  #ln -s /usr/lib/libncurses.so.5 libtinfo.so.5
}