# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# WARNING: this is a package for a beta version of CUDA. If you need a stable
# and reliable version, please use the "cuda-toolkit" package instead.
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda-toolkit-beta" as root

pkgname=cuda-toolkit-beta
pkgver=4.1.21
_shortver=4.1
pkgrel=1
_fedver=14
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')

url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')

depends=('gcc45' 'ncurses' 'nvidia>=285.05' 'opencl-nvidia' 'python2')
optdepends=('libxtst: for the NVIDIA Visual Profiler'
            'libxrender: for the NVIDIA Visual Profiler'
            'libxt: for the NVIDIA Visual Profiler'
            'lib32-nvidia-utils')
mkdepends=('perl')
options=(!strip)

provides=("opencl-headers" "cuda-toolkit=${pkgver}" "thrust")
conflicts=("opencl-headers" "cuda-toolkit" "thrust")
replaces=("thrust")

if [ "$CARCH" = "i686" ]; then
  _bits=32
  md5sums=('930b7bfd1a162335b909f119a004f6d7')
  sha256sums=('ad2317371a87d7642d1385e06e4ea1820b28ae94b4686cf8e4171d0d759364e3')
else
  _bits=64
  md5sums=('509c795b9b79f991e045a83576e2e2f3')
  sha256sums=('249ee7ce7a6fdb0c289f9a89b59429aa605cf061c474532e6eb53c76f9b9a0ed')
fi

source=(http://developer.download.nvidia.com/compute/cuda/4_1/RC2/toolkit/cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run)
install=cuda-toolkit.install

# This is ugly, but saves a lot of time: don't compress the package with xz.
#PKGEXT=".pkg.tar"

build() {
  cd "$srcdir"
  
  msg2 "Uncompressing the CUDA toolkit..."
  sh cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run --noexec --keep --target toolkit &>/dev/null

  msg2 "Patching the install script..."
  # don't uninstall first
  sed -i 's/my $yesno = ""/my $yesno = "no"/' toolkit/install-linux.pl

  #Inspection hook
  #echo "Inspect srcdir"
  #read 
}

package() {
  cd "$srcdir/toolkit"

  msg2 "Installing the CUDA toolkit..."
  install -dm755 "$pkgdir/usr/cuda"
  ./install-linux.pl --prefix="$pkgdir/usr/cuda" >/dev/null

  msg2 "Fixing paths..."
  sed -i "s#$pkgdir##g" "$pkgdir/usr/cuda/bin/nvvp"

  msg2 "Creating required symlinks..."
  install -dm755 "$pkgdir/usr/cuda/gcc-4.5"
  ln -s ../../bin/gcc-4.5 "$pkgdir/usr/cuda/gcc-4.5/gcc"
  ln -s ../../bin/g++-4.5 "$pkgdir/usr/cuda/gcc-4.5/g++"

  # Hack: cuda-gdb needs libtinfo.so.5, which is apparently now in ncurses
  ln -s ../../lib/libncurses.so.5 "$pkgdir/usr/cuda/lib/libtinfo.so.5"

  msg2 "Patching nvcc.profile for gcc-4.5..."
  # Thanks to Valentine Sinitsyn for the idea!
  echo '' >> "$pkgdir/usr/cuda/bin/nvcc.profile"
  echo '# Arch-specific paths' >> "$pkgdir/usr/cuda/bin/nvcc.profile"
  echo 'compiler-bindir  = /usr/cuda/gcc-4.5' >> "$pkgdir/usr/cuda/bin/nvcc.profile"

  msg2 "Adding config files in /etc/ld.so.conf.d and /etc/profile.d..."
  # ldconfig
  install -dm755 "$pkgdir/etc/ld.so.conf.d"
  (
    [[ -d "$pkgdir/usr/cuda/lib" ]] && echo "/usr/cuda/lib"
    [[ -d "$pkgdir/usr/cuda/lib64" ]] && echo "/usr/cuda/lib64"
  ) > "$pkgdir/etc/ld.so.conf.d/cuda-toolkit.conf"

  # profile
  install -dm755 "$pkgdir/etc/profile.d"
  echo 'export PATH="${PATH}:/usr/cuda/bin"' > "$pkgdir/etc/profile.d/cuda-toolkit.sh"

  msg2 "Installing license information..."
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../../cuda/doc/EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  #Inspection hook
  #echo "Inspect pkgdir"
  #read 
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
