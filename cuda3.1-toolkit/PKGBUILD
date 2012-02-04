# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda3-toolkit" as root.

pkgname=cuda3.1-toolkit
_pkgname=cuda-toolkit
pkgver=3.1
pkgrel=1
_shortver=3_1
_fedver=12
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')

url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')

depends=('gcc-libs' 'ncurses' 'zlib')
optdepends=('libpng12: for the Compute Visual Profiler'
            'libxext: for the Compute Visual Profiler'
            'qt: for the Compute Visual Profiler'
            'qt-assistant-compat: for the Compute Visual Profiler')

provides=('opencl-headers' "cuda-toolkit=$pkgver")
conflicts=('opencl-headers' 'cuda-toolkit')

if [ "$CARCH" = "i686" ]; then
  _bits=32
  md5sums=('da98863cf8d538a083dd8958133f76a9')
else
  _bits=64
  md5sums=('aa4a4e0dab68edca5dfae9babfecac5d')
fi

source=(http://developer.download.nvidia.com/compute/cuda/${_shortver}/toolkit/cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run)

build() {
#  cd "$srcdir"
  sh $srcdir/cudatoolkit_${pkgver}_linux_${_bits}_fedora${_fedver}.run --noexec --keep

  #Inspection hook
  #echo "Inspect srcdir"
  #read 
}

package() {
  # Installing by hand will be easier than using the stupid install script
#	install -D "$srcdir/pkg" "$pkgdir/usr/share/$pkgname"
	cd $pkgdir
	mkdir -p usr/local/$pkgname
	for x in $srcdir/pkg/*
	do
		mv "$x" "usr/local/$pkgname"
	done
#	mv "$pkgdir/usr/share/$pkgname/pkg" "$pkgdir/usr/share/$pkgname"
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
