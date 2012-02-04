# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda3-toolkit" as root.

pkgname=cuda3.1-sdk
_pkgname=cuda-sdk
pkgver=3.1
pkgrel=1
_shortver=3_1
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')

url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')

makedepends=('cuda3.1-toolkit')

options=(!strip)
md5sums=('2ef5b8cda339f9b1adea85dc26159c9e')


source=(http://developer.download.nvidia.com/compute/cuda/${_shortver}/sdk/gpucomputingsdk_${pkgver}_linux.run)

build() {
	cd "$srcdir"
	echo "Extracting CUDA SDK ..."
	sh gpucomputingsdk_${pkgver}_linux.run --noexec --keep
	cd pkg/sdk/C/common
	sed -i 's/\/usr\/local\/cuda/\/usr\/local\/cuda3.1-toolkit/g' common.mk
	echo "Building C/common ..."
	make
  #Inspection hook
  #echo "Inspect srcdir"
  #read 
}

package() {
  # Installing by hand will be easier than using the stupid install script
#	install -D "$srcdir/pkg" "$pkgdir/usr/share/$pkgname"
	cd $pkgdir
	mkdir -p usr/local/$pkgname/
	for x in $srcdir/pkg/sdk/*
	do
		mv "$x" "usr/local/$pkgname/"
	done
#	mv "$pkgdir/usr/share/$pkgname/pkg" "$pkgdir/usr/share/$pkgname"
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
