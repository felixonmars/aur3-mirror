# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
# CARCH=i686

# Based on ifort's PKGBUILD

pkgname=intel-compilers-common
_comp=f
_COMP=`echo "${_comp}" | tr "[a-z]" "[A-Z]"`
#pkgver=11.0.069
#_urlnumber=1259
pkgver=11.0.074
_urlnumber=1315
pkgrel=2
pkgdesc="The Intel Compilers common files"
url="http://developer.intel.com/software/products/compilers/flin/"
arch=('i686' 'x86_64')
license=('custom')
depends=()
makedepends=(rpmextract)
source=("EULA.htm" "intel-compilers-common-generic.txt")
md5sums=('df1337eb0b74e33cdbc6de794ade29f4' '31c1810fb4aab1a2d6c350ae5986283e')
_archive=l_cpro${_comp}_p_${pkgver}
if [ "$CARCH" = "i686" ]; then
    _intel_arch=i386
    _bits=32
    _intel_arch2=ia32
    _intel_64char=
    md5sums=('7d9221b5b59b2d6edc6e51c756be84bb' ${md5sums[@]})
else
    _intel_arch=em64t
    _bits=64
    _intel_arch2=intel64
    _intel_64char=e
    md5sums=('6c7db08ec48665f81b29cafed81f2eac' ${md5sums[@]})
fi
_archive_arch=${_archive}_${_intel_arch2}
source=(http://registrationcenter-download.intel.com/irc_nas/${_urlnumber}/${_archive_arch}.tgz ${source[@]})

build() {
    ######################################################################################
    # Common part with icc and ifort
    _intel_arch_file=`basename ${source[0]}`
    _intel_arch_file=${_intel_arch_file/.tar.gz/}
    _intel_arch_file=${_intel_arch_file##*_}
    _compiler=${source[0]#*l_}
    _compiler=${_compiler%%_*}
    _comp_ver=`echo $source[0] | sed -e "s|.*/l_${_compiler}_||g" -e "s|_${pkgver}.*||g"`

    _licensefile=${source[1]}
    _major_version=${pkgver%%.*}
    _build_version=${pkgver##*.}
    _minor_version=`echo ${pkgver} | sed -e "s/${_major_version}.//g" -e "s/.${_build_version}//g"`
    _compact_version=${_major_version}${_minor_version}${_build_version}

    mkdir -p $startdir/src/unpacked
    cd $startdir/src/unpacked

    msg "Unpacking RPM archive (intel-cpro${_comp}${_compact_version}${_intel_64char}-${_major_version}.${_minor_version}-*.rpm)..."
    i=../${_archive_arch}/${_archive}/intel-cpro${_comp}${_compact_version}${_intel_64char}-${_major_version}.${_minor_version}-*.rpm
    rpmextract.sh $i &> /dev/null || return 1

    # The following variables are defined in the original install script
    # They make copying the original code easier.
    _INSTALLROOT=/opt/intel/Compiler
    DESTINATION=${_INSTALLROOT}/${_major_version}.${_minor_version}/${_build_version}
    SUPPORTFILE=${pkgdir}${DESTINATION}/doc/fsupport

    msg "Copying EULA..."
    install -D -m 644 \
        $startdir/src/EULA.htm \
        $startdir/pkg/usr/share/licenses/$pkgname/EULA.htm || return 1

    # End of common part with icc and ifort
    ######################################################################################

    msg "Copying common files..."
    sed "s|ARCHDIR|${_intel_arch2}|g" ${srcdir}/intel-compilers-common-generic.txt > ${srcdir}/intel-compilers-common.txt || return 1
    common_filenames=(`cat ${srcdir}/intel-compilers-common.txt`) || return 1
    for f in ${common_filenames[*]}; do
        dir=`dirname ${f}`
        mkdir -p ${pkgdir}${DESTINATION}/${dir} || return 1
        if [[ -e .${DESTINATION}/${f} ]]; then
            cp .${DESTINATION}/${f} ${pkgdir}${DESTINATION}/${dir} || return 1
        fi
    done
}
