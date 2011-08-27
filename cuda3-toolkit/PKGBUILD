# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda3-toolkit" as root.

pkgname=cuda3-toolkit
_pkgname=cuda-toolkit
pkgver=3.2.16
pkgrel=2
_shortver=3_2
_fedver=13
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')

url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')

depends=('gcc-libs' 'nvidia>=260.19.21' 'ncurses' 'zlib')
optdepends=('libpng12: for the Compute Visual Profiler'
            'libxext: for the Compute Visual Profiler'
            'qt: for the Compute Visual Profiler'
            'qt-assistant-compat: for the Compute Visual Profiler')

provides=('opencl-headers' "cuda-toolkit=$pkgver")
conflicts=('opencl-headers' 'cuda-toolkit')

if [ "$CARCH" = "i686" ]; then
  _bits=32
  md5sums=('ce984b22e6cadb39c16bc0452ae7843e')
else
  _bits=64
  md5sums=('aa4a4e0dab68edca5dfae9babfecac5d')
fi

source=(http://developer.download.nvidia.com/compute/cuda/${_shortver}_prod/toolkit/cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run)

build() {
  cd "$srcdir"
  sh cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run --noexec --keep

  #Inspection hook
  #echo "Inspect srcdir"
  #read 
}

package() {
  # Installing by hand will be easier than using the stupid install script
  cd "$srcdir/pkg"

  # Binaries
  find bin/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
  chmod 644 "$pkgdir/usr/bin/nvcc.profile"
  install -Dm755 computeprof/bin/computeprof "$pkgdir/usr/bin/computeprof"
  install -Dm755 open64/bin/nvopencc "$pkgdir/usr/bin/nvopencc"

  # Headers
  find include/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/{}" \;

  # Doc
  cd doc
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$_pkgname/{}" \;
  cd ../computeprof/doc
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$_pkgname/computeprof/{}" \;
  cd ../..
  install -Dm644 computeprof/Compute_Visual_Profiler_Release_Notes_Linux.txt "$pkgdir/usr/share/doc/$_pkgname/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../doc/$_pkgname/EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  # Libraries
  if [ "$CARCH" = "i686" ]; then
    find lib/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
  else
    find lib/ lib64/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
    rm -rf "$pkgdir/usr/lib32"
    mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  fi
  cd open64
  find lib/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
  cd ..

  for _lib in $(find "$pkgdir" -name '*.so*'); do
    _soname="$(dirname ${_lib})/$(readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
    if [ ! -e "${_soname}" ]; then
      ln -s "$(basename ${_lib})" "${_soname}"
      ln -s "$(basename ${_soname})" "${_soname/.[0-9]*/}"
    fi
  done

  # Examples
  find computeprof/projects/ src/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$_pkgname/{}" \;

  # Hack: cuda-gdb needs libtinfo.so.5, which is apparently now in ncurses
  ln -s libncurses.so.5 "$pkgdir/usr/lib/libtinfo.so.5"

  #Inspection hook
  #echo "Inspect pkgdir"
  #read 
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
