# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda-toolkit" as root.

pkgname=cuda-toolkit
pkgver=4.0.17
_shortver=4.0
pkgrel=2
_fedver=13
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')

url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')

depends=('gcc44' 'gcc-libs' 'nvidia>=270.41' 'ncurses' 'zlib')
optdepends=('libpng12: for the Compute Visual Profiler'
            'libxext: for the Compute Visual Profiler'
            'qt: for the Compute Visual Profiler'
            'qt-assistant-compat: for the Compute Visual Profiler')

provides=("opencl-headers" "thrust")
conflicts=("opencl-headers" "thrust")
replaces=("thrust")

if [ "$CARCH" = "i686" ]; then
  _bits=32
  md5sums=('20d69b2d5bb7043ca7c2ad679c2825ed'
           '6426892e521b931a18b57e3680b1cc4e')
else
  _bits=64
  md5sums=('152e1069f39fc8bbece875a1b9f576b6'
           '1fc9673eccb604ed6e386397b995ec25')
  optdepends=("${optdepends[@]}"
              'lib32-nvidia-utils: for profiling 32 bits CUDA applications')
fi

source=(http://developer.download.nvidia.com/compute/cuda/4_0/toolkit/cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run
        http://developer.download.nvidia.com/compute/cuda/4_0/ToolsSDK/cudatools_${pkgver}_linux_${_bits}.run)

#PKGEXT=".pkg.tar.gz"

build() {
  cd "$srcdir"
  
  msg2 "Uncompressing the CUDA toolkit..."
  sh cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run --noexec --keep --target toolkit >/dev/null

  msg2 "Uncompressing the CUDA tools SDK..."
  sh cudatools_${pkgver}_linux_${_bits}.run --noexec --keep --target tools >/dev/null

  msg2 "Patching nvcc.profile..."
  # Thanks Valentine Sinitsyn for the idea!
  echo '' >> toolkit/bin/nvcc.profile
  echo '# Arch-specific paths' >> toolkit/bin/nvcc.profile
  echo 'INCLUDES        += "-I$(TOP)/include/cuda" $(_SPACE_)' >> toolkit/bin/nvcc.profile
  echo 'compiler-bindir  = /opt/gcc-4.4' >> toolkit/bin/nvcc.profile

  #Inspection hook
  #echo "Inspect srcdir"
  #read 
}

package() {
  # Installing by hand will be easier than using the stupid install scripts. And cleaner too.

  ### TOOLKIT ###
  msg2 "Installing the CUDA Toolkit..."
  cd "$srcdir/toolkit"

  # Binaries
  plain "binaries"
  find bin/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
  chmod 644 "$pkgdir/usr/bin/nvcc.profile"
  install -Dm755 computeprof/bin/computeprof "$pkgdir/usr/bin/computeprof"
  install -Dm755 open64/bin/nvopencc "$pkgdir/usr/bin/nvopencc"

  # Headers
  plain "headers"
  cd include
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/include/cuda/{}" \;
  mv "$pkgdir/usr/include/cuda/CL" "$pkgdir/usr/include/CL"

  # Doc
  plain "documentation"
  cd ../doc
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/{}" \;
  cd ../computeprof/doc
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/computeprof/{}" \;
  cd ../..
  install -Dm644 computeprof/Compute_Visual_Profiler_Release_Notes_Linux.txt "$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../doc/$pkgname/EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  # Libraries
  plain "libraries"
  if [ "$CARCH" = "i686" ]; then
    find lib/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
    install -Dm755 computeprof/bin/cudaapitrace32.so "$pkgdir/usr/lib/"
  else
    find lib/ lib64/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
    rm -rf "$pkgdir/usr/lib32"
    mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
    install -Dm755 computeprof/bin/cudaapitrace32.so "$pkgdir/usr/lib32/"
    install -Dm755 computeprof/bin/cudaapitrace64.so "$pkgdir/usr/lib/"
  fi
  cd open64
  find lib/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
  cd ..

  # Examples
  plain "examples"
  find computeprof/projects/ src/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$pkgname/{}" \;

  ### TOOLS ###
  # (untested, not sure it really belongs in this package)
  msg2 "Installing the CUDA tools SDK..."
  cd "$srcdir/tools"

  # CUPTI
  plain "CUPTI"
  cd CUPTI/include
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/include/cuda/cupti/{}" \;
  cd ../doc
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/cupti/{}" \;
  cd ..
  find lib/ -type f -exec install -Dm755 "{}" "$pkgdir/usr/{}" \;
  find sample/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$pkgname/cupti/{}" \;

  # Debugger
  plain "debugger"
  cd ../Debugger/doc
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/{}" \;
  cd ../include
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/include/cuda/{}" \;

  # NVML
  plain "NVML"
  cd ../../NVML
  find . -type f -name '*.h' -exec install -Dm644 "{}" "$pkgdir/usr/include/cuda/{}" \;
  find . -type f -name '*.dtd' -exec install -Dm644 "{}" "$pkgdir/usr/share/cuda/nvml/{}" \;
  cd doxygen
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/cuda/nvml/{}" \;
  # Don't install nvidia-smi, the library and the manpage, they are already in nvidia-utils
  
  ### COMMON ###
  msg2 "Creating required symlinks..."

  # Create required symlinks to libraries
  for _lib in $(find "$pkgdir" -name '*.so*'); do
    _soname="$(dirname ${_lib})/$(readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
    if [ ! -e "${_soname}" ]; then
      ln -s "$(basename ${_lib})" "${_soname}"
      ln -s "$(basename ${_soname})" "${_soname/.[0-9]*/}"
    fi
  done

  # Hack: cuda-gdb needs libtinfo.so.5, which is apparently now in ncurses
  ln -s libncurses.so.5 "$pkgdir/usr/lib/libtinfo.so.5"

  #Inspection hook
  #echo "Inspect pkgdir"
  #read 
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
