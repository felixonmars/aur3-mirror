# Maintainer: Danny George <dangets@gmail.com>
# adapted from current cuda-toolkit PKGBUILD
pkgname=cuda5-toolkit
pkgver=5.0.35
pkgrel=1
_fedver=16
pkgdesc="NVIDIA's GPU programming toolkit"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=('gcc-libs' 'opencl-nvidia')
optdepends=('gdb: for cuda-gdb')
if [ "$CARCH" = "i686" ]; then
  _arch=32
  md5sums=()
else
  _arch=64
  md5sums=('0ffd4b374c9974b1045ef58839dfea7c')
fi
install=cuda5-toolkit.install

installer=cuda_${pkgver}_linux_${_arch}_fedora${_fedver}.run
source=(http://developer.download.nvidia.com/compute/cuda/5_0/rel/installers/${installer})

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  prefix=/opt/cuda5-toolkit

  mkdir -p ${pkgdir}/${prefix}

  sh ${installer} -toolkitpath=${pkgdir}/${prefix} -samplespath=${pkgdir}/${prefix} \
      -toolkit -override -silent

  #sed -i "/unsupported GNU/d" $pkgdir/opt/cuda-toolkit/include/host_config.h
  #sed -i "s|/build/pkg||g" $pkgdir/opt/cuda-toolkit/bin/nvvp

  echo "export PATH=\$PATH:${prefix}/bin" > cuda5-toolkit.sh

  echo "${prefix}/lib64" >  cuda5-toolkit.conf
  echo "${prefix}/lib"   >> cuda5-toolkit.conf

  install -Dm755 cuda5-toolkit.sh   $pkgdir/etc/profile.d/cuda5-toolkit.sh
  install -Dm644 cuda5-toolkit.conf $pkgdir/etc/ld.so.conf.d/cuda5-toolkit.conf
  install -Dm644 $pkgdir/$prefix/doc/EULA.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # make a symbolic link from nvcc to nvcc5
  cd ${pkgdir}/${prefix}/bin
  ln -s nvcc nvcc5

  #mkdir -p $pkgdir/usr/lib
  #cd $pkgdir/usr/lib
  #ln -s /usr/lib/libncurses.so.5 libtinfo.so.5
}
