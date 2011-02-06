# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>

pkgname=eclipse-icc
_comp=c
pkgver=10.0.026
_urlnumber=786
pkgrel=1
pkgdesc="The Intel C/C++ Compiler integration into Eclipse"
url="http://www3.intel.com/cd/software/products/asmo-na/eng/compilers/clin/277618.htm"
arch=('i686' 'x86_64')
license=('custom')
depends=("glibc" "libstdc++5" "icc=${pkgver}" "eclipse")
makedepends=(rpmextract)
if [ "$CARCH" = "i686" ]; then
	_intel_arch=i386
	_intel_64char=
else
	_intel_arch=em64t
	_intel_64char=e
fi
source=(http://registrationcenter-download.intel.com/irc_nas/${_urlnumber}/l_${_comp}c_c_${pkgver}_ia32.tar.gz license.txt)
md5sums=('e8f98099af55d41d683d8a037a6dbac7'
         '1034f17e98a8affd04f91082b0114b03')

build() {
	_intel_arch_file=`basename ${source[0]}`
	_intel_arch_file=${_intel_arch_file/.tar.gz/}
	_intel_arch_file=${_intel_arch_file##*_}
	_compiler=${source[0]#*l_}
	_compiler=${_compiler%%_*}
	_comp_ver=`echo $source[0] | sed -e "s|.*/l_${_compiler}_||g" -e "s|_${pkgver}.*||g"`

	_major_version=${pkgver%%.*}
	_build_version=${pkgver##*.}
	_minor_version=`echo ${pkgver} | sed -e "s/${_major_version}.//g" -e "s/.${_build_version}//g"`

	mkdir -p $startdir/src/unpacked
	cd $startdir/src/unpacked

	rpmextract.sh ../l_${_compiler}_${_comp_ver}_${pkgver}_${_intel_arch_file}/data/intel-icc_ide*.rpm &> /dev/null || return 1

	find $startdir/src/unpacked -type d -exec chmod 755 {} \; || return 1
	mkdir -p $startdir/pkg/opt/eclipse
	mv $startdir/src/unpacked/opt/intel/cc/$pkgver/eclipse $startdir/pkg/opt
	rm -fr $startdir/pkg/intel

	install -D -m 644 $startdir/src/license.txt $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
