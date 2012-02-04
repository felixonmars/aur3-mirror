# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
# CARCH=i686
# ./install_fc.sh  --arch=x86_64 --nonrpm --run --log=log2.log --silent SilentInstallConfigFile.ini --tmp-path=/home/nicolas/tmp --install-path=/home/nicolas/test/ &> test.log
pkgname=ifort
_comp=f
_COMP=`echo "${_comp}" | tr "[a-z]" "[A-Z]"`
# pkgver=11.0.069
# _urlnumber=1259
pkgver=11.0.074
_urlnumber=1315
pkgrel=2
pkgdesc="The Intel Fortran 2003 Compiler"
url="http://developer.intel.com/software/products/compilers/flin/"
arch=('i686' 'x86_64')
license=('custom')
depends=("glibc" "libstdc++5" "intel-compilers-common==${pkgver}")
makedepends=(rpmextract)
source=(\
    "NCOM_L_CMP_FOR_????-????????.lic" \
    "intel-compilers-common-generic.txt" \
    "profile.sh" \
    "profile.csh" \
)
md5sums=('c71cf36585a317df87f3d7603b94858f' # <--- Change to your own license md5sum !!!
         '31c1810fb4aab1a2d6c350ae5986283e' # intel-compilers-common-generic.txt
         'd07d7716f677ca5f569254949002c400' # profile.sh
         '99cbee1481571e15e0e78d1378d8c5fa' # profile.csh"
)
_archive=l_cpro${_comp}_p_${pkgver}
if [ "$CARCH" = "i686" ]; then
    _intel_arch=i386
    _bits=32
    _intel_arch2=ia32
    _intel_64char=
    #depends=()
    md5sums=('7d9221b5b59b2d6edc6e51c756be84bb' ${md5sums[@]})
else
    _intel_arch=em64t
    _bits=64
    _intel_arch2=intel64
    _intel_64char=e
    #depends=(lib32-gcc lib32-libstdc++5)
    md5sums=('6c7db08ec48665f81b29cafed81f2eac' ${md5sums[@]})
fi
_archive_arch=${_archive}_${_intel_arch2}
source=(http://registrationcenter-download.intel.com/irc_nas/${_urlnumber}/${_archive_arch}.tgz ${source[@]})
install=${pkgname}.install

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

#     msg "Unpacking the debugger..."
#     i=../l_${_compiler}_${_comp_ver}_${pkgver}_${_intel_arch_file}/data/intel-*idb${_intel_64char}*.${_intel_arch}.rpm
#     rpmextract.sh $i &> /dev/null || return 1

    # The following variables are defined in the original install script
    # They make copying the original code easier.
    _INSTALLROOT=/opt/intel/Compiler
    DESTINATION=${_INSTALLROOT}/${_major_version}.${_minor_version}/${_build_version}
    SUPPORTFILE=${pkgdir}${DESTINATION}/doc/fsupport

    msg "chmod'ing 755 directories..."
    find ${srcdir}/unpacked -type d -exec chmod 755 {} \; || return 1
    mv $startdir/src/unpacked/opt $startdir/pkg/ || return 1

    # Way simpler then the UNTAG_CFG_FILES function of the original install script
    msg "Updating INSTALLDIR values in script files..."
    for FILE in $startdir/pkg${DESTINATION}/bin/*.*sh; do
        sed -i s@\<INSTALLDIR\>@${DESTINATION}@g $FILE || return 1
        #chmod 755 $FILE || return 1
    done
    for FILE in $startdir/pkg${DESTINATION}/bin/${_intel_arch2}/*; do
        if [[ -f $FILE ]]; then
            sed -i s@\<INSTALLDIR\>@${DESTINATION}@g $FILE || return 1
            #chmod 755 $FILE || return 1
        fi
    done

    #install -d $startdir/pkg/usr/lib/
    #ln -s "${DESTINATION}/lib/ifcore_msg.cat" "$startdir/pkg/usr/lib/ifcore_msg.cat" || return 1

    rm $startdir/pkg${DESTINATION}/bin/${_intel_arch2}/uninstall*.sh || return 1

    cd $startdir/src

    msg "Updating etc/profile.d/${pkgname}.sh..."
    install -D -m 755 ${srcdir}/profile.sh \
       ${pkgdir}/etc/profile.d/${pkgname}.sh || return 1
    install -D -m 755 ${srcdir}/profile.csh \
       ${pkgdir}/etc/profile.d/${pkgname}.csh || return 1
    sed \
        -e "s|DESTINATION|${DESTINATION}|g" \
        -e "s|INTELARCH|${_intel_arch2}|g" \
        -e "s|PKGNAME|${pkgname}|g" \
        -i ${pkgdir}/etc/profile.d/${pkgname}.sh || return 1

    msg "Copying license..."
    install -D -m 644 \
        $startdir/src/${_licensefile} \
        $startdir/pkg${DESTINATION}/licenses/${_licensefile} || return 1

    mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
    cd $startdir/pkg${DESTINATION}/licenses/
    for FILE in *; do
        install -D -m 644 $FILE $startdir/pkg/usr/share/licenses/$pkgname/$FILE || return 1
    done

    msg "Copying release notes..."
    install -D -m 644 \
        $startdir/src/${_archive_arch}/Release_Notes${_COMP}.pdf \
        $startdir/pkg${DESTINATION}/Release_Notes${_COMP}.pdf || return 1
    rm -f $startdir/pkg/usr/share/licenses/$pkgname/*.lic || return 1

    msg "Removing manpath from ${pkgname}vars_${_intel_arch2}.{sh,csh}..."
    sed \
        -e "s|:\$(manpath)||g" \
        -i ${pkgdir}${DESTINATION}/bin/${_intel_arch2}/${pkgname}vars_${_intel_arch2}.sh \
        || return 1
    sed \
        -e "s|:\`manpath\`||g" \
        -i ${pkgdir}${DESTINATION}/bin/${_intel_arch2}/${pkgname}vars_${_intel_arch2}.csh \
        || return 1

    msg "Updating ${pkgname}.install to edit ld.so.conf correctly"
    sed \
        -e "s#echo \".*#echo \"${DESTINATION}/lib\" >> /etc/ld.so.conf#g" \
        -e "s#sed -i \".*#sed -i \"${_INSTALLROOT}/.*/lib||g\" /etc/ld.so.conf#g" \
        -i ${startdir}/${pkgname}.install \
        || return 1

    msg "Stripping package from icc and ifort common files (provided by intel-compilers-common)"
    sed "s|ARCHDIR|${_intel_arch2}|g" ${srcdir}/intel-compilers-common-generic.txt > ${srcdir}/intel-compilers-common.txt || return 1
    common_filenames=(`cat ${srcdir}/intel-compilers-common.txt`) || return 1
    for f in ${common_filenames[*]}; do
        dir=`dirname ${f}`
        mkdir -p ${pkgdir}${DESTINATION}/${dir} || return 1
        #msg "Removing ${pkgdir}${DESTINATION}/${f}"
        rm -f ${pkgdir}${DESTINATION}/${f} || return 1
    done

    # End of common part with icc and ifort
    ######################################################################################
}
