# Contributor: Thomas Jost <schnouki@schnouki.net> Main PKGBUILD
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: Pat <whaevr[at]archlinux[dot]us> all I did was adapt it for FAH lib32
pkgname=lib32-cuda-toolkit
pkgver=3.0
pkgrel=1
pkgdesc="NVIDIA's CUDA libraries for use with CUDA wrapper for folding@home"
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=('lib32-gcc-libs' 'lib32-nvidia-utils>=256.40' 'lib32-zlib')
source=(http://developer.download.nvidia.com/compute/cuda/3_0/toolkit/cudatoolkit_${pkgver}_linux_32_suse11.1.run)
md5sums=('718a8672d450e850371c921111536957')

build() {
  cd $srcdir
  sh cudatoolkit_${pkgver}_linux_32_suse11.1.run --noexec --keep

  #Inspection hook
  #echo "Inspect srcdir"
  #read 
}
package() {
  # Installing by hand will be easier than using the stupid install script
  cd $srcdir/pkg

  # Binaries
  find bin/ -type f -exec install -Dm755 \{\} $pkgdir/usr/\{\} \;
  chmod 644 $pkgdir/usr/bin/nvcc.profile
  install -Dm755 cudaprof/bin/cudaprof $pkgdir/usr/bin/cudaprof
  install -Dm755 open64/bin/nvopencc $pkgdir/usr/bin/nvopencc

  # Headers
  find include/ -type f -exec install -Dm644 \{\} $pkgdir/usr/\{\} \;

  # Doc
  cd doc
  find . -type f -exec install -Dm644 \{\} $pkgdir/usr/share/doc/$pkgname/\{\} \;
  cd ../cudaprof/doc
  find . -type f -exec install -Dm644 \{\} $pkgdir/usr/share/doc/$pkgname/cudaprof/\{\} \;
  cd ../..
  install -Dm644 cudaprof/CUDA_Visual_Profiler_Release_Notes.txt $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s ../../doc/$pkgname/EULA.txt $pkgdir/usr/share/licenses/$pkgname/EULA.txt

  # Libraries
  find lib/ -type f -exec install -Dm755 \{\} $pkgdir/usr/\{\} \;
  cd open64
  find lib/ -type f -exec install -Dm755 \{\} $pkgdir/usr/\{\} \;
  mv $pkgdir/usr/lib $pkgdir/usr/lib32
  cd ..

  for _lib in $(find $pkgdir -name '*.so*'); do
    _soname="$(dirname ${_lib})/$(readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
    if [ ! -e "${_soname}" ]; then
      ln -s "$(basename ${_lib})" "${_soname}"
      ln -s "$(basename ${_soname})" "${_soname/.[0-9]*/}"
    fi
  done

  # Examples
  find cudaprof/projects/ src/ -type f -exec install -Dm644 \{\} $pkgdir/usr/share/$pkgname/\{\} \;

  # Hack: cuda-gdb needs libtinfo.so.5, which is apparently now in ncurses
  ln -s libncurses.so.5 $pkgdir/usr/lib32/libtinfo.so.5

  #Inspection hook
  #echo "Inspect pkgdir"
  #read 
}
