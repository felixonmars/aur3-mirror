# Maintainer: Nicolas Bigaouette <nbigaouette@gmail.com>
# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
# CARCH=i686

pkgname=icc
_comp=c
#pkgver=11.0.069
#_urlnumber=1255
#pkgver=11.0.074
#_urlnumber=1309
# pkgver=11.0.081
# _urlnumber=1377
# pkgver=11.0.083
# _urlnumber=1431
# pkgver=11.1.046
# _urlnumber=1536
# pkgver=11.1.056
# _urlnumber=1583
# pkgver=11.1.059
# _urlnumber=1624
# pkgver=11.1.064
# _urlnumber=1657
#pkgver=11.1.069
#_urlnumber=1703
# pkgver=11.1.072
# _urlnumber=1768
pkgver=11.1.073
_urlnumber=1924


pkgrel=1
pkgdesc="The Intel C/C++ Compiler (debugger included)"
url="http://software.intel.com/en-us/intel-compilers/"
arch=('i686' 'x86_64')
license=('custom')
depends=("glibc" "libstdc++5" "bash")
makedepends=("rpmextract" "cpio")
conflicts=("intel-compilers-common")
#optdepends=("gcc43: GCC v4.3.4 (Last version compatible with ICC)")

if [ "$CARCH" = "i686" ]; then
    _intel_arch=i386
    _bits=32
    _intel_arch2=ia32
    _intel_64char=
    _archive_md5="1e11fc2069d51c1044b64105f27dc268"
else
    _intel_arch=em64t
    _bits=64
    _intel_arch2=intel64
    _intel_64char=e
    #depends=(lib32-libstdc++5 ${depends[@]})
    _archive_md5="20c321f2745e003e1769f58b4395fa98"
fi
_archive=l_cpro${_comp}_p_${pkgver}
_archive_arch=${_archive}_${_intel_arch2}

source=("http://registrationcenter-download.intel.com/irc_nas/${_urlnumber}/${_archive_arch}.tgz"
        "profile.sh"
        "silent.ini")

md5sums=("${_archive_md5}"                  # Main archive
         'c4b4d62408e0a5c56b8497e674329c4e' # profile.sh
         '32e6a3398e2625a816b8c894fbf88fae' # silent.ini
)
install=${pkgname}.install

function change_link() {
    # Remove pkgdir from link
    link=`\ls -l $1 | sed -e "s|.*${pkgdir}\(.*\)|\1|g"`
    rm -f $1
    ln -s ${link} $1
}

build() {
    ######################################################################################
    # Common part with icc and ifort
    # BREAKS AUR!!!
    #_intel_arch_file=`basename ${source[0]}`
    #_intel_arch_file=${_intel_arch_file/.tar.gz/}
    #_intel_arch_file=${_intel_arch_file##*_}
    #_compiler=${source[0]#*l_}
    #_compiler=${_compiler%%_*}
    #_comp_ver=`echo $source[0] | sed -e "s|.*/l_${_compiler}_||g" -e "s|_${pkgver}.*||g"`

    _major_version=${pkgver%%.*}
    _build_version=${pkgver##*.}
    _minor_version=`echo ${pkgver} | sed -e "s/${_major_version}.//g" -e "s/.${_build_version}//g"`
    _compact_version=${_major_version}${_minor_version}${_build_version}

    _INSTALLROOT=/opt/intel/Compiler
    DESTINATION=${_INSTALLROOT}/${_major_version}.${_minor_version}/${_build_version}
    SUPPORTFILE=${pkgdir}${DESTINATION}/doc/fsupport
    ######################################################################################

    cd ${srcdir}/${_archive_arch}

    echo " " && echo " "
    msg "         Please obtain a license file from:"
    msg "             http://software.intel.com/en-us/intel-compilers/"
    msg "         and place it in /opt/intel/licenses/"
    msg "Press any key to continue..."
    read -p " "

    _licensefile_nb=0
    for f in /opt/intel/licenses/*.lic; do
        _licensefile[_licensefile_nb]=$f
        _licensefile_nb=$(($_licensefile_nb+1))
    done
    if [[ ! -f "${_licensefile[0]}" ]]; then
        msg "ERROR:"
        msg "         Due to a requirement in Intel's installation script, the"
        msg "         license file needs to be placed in /opt/intel/licenses/"
        msg "         BEFORE calling 'makepkg'."
        msg "         Please copy it there NOW and re-run 'makepkg':"
        msg "         $ sudo mkdir -p /opt/intel/licenses/"
        msg "         $ sudo cp NCOM_L_CMP__*.lic /opt/intel/licenses/"
        msg "         $ makepkg"
        msg "Aborting."
        return 1
    fi

    # Make sure we install in pkgdir
    sed -e "s|PSET_INSTALL_DIR=.*|PSET_INSTALL_DIR=${pkgdir}${DESTINATION}|g" ${srcdir}/silent.ini > ./silent.ini

    # See http://software.intel.com/en-us/articles/intel-compilers-for-linux-version-111-silent-installation-guide/
    msg "Unpacking..."
    #./install.sh --silent ./silent.ini > /dev/null
    ./install.sh --silent ./silent.ini

    msg "Unpacking done. Note that Intel's install script creates a folder 'intel' in your home"
    msg "directory with a database of unpacked files. This is useless."
    msg "You might want to delete this folder:"
    msg "    /home/${USER}/intel"
#     msg "Do you want to delete it? [y/N]"
#     cmd="rm -fr /home/${USER}/intel"
#     msg "Do you want to execute the following command? [y/N]"
#     msg "    $cmd"
#     read -s answer
#     if [[ "${answer}" == "y" || "${answer}" == "yes" ]]; then
#         #rm -fr /home/${USER}/intel
#         eval "${cmd}"
#     fi

    msg "Removing '${pkgdir}' from all files containing it"
    grep -irl "${pkgdir}" ${pkgdir}${DESTINATION}/* | xargs sed -i "s|${pkgdir}||g" || return 1

    cd ${srcdir}

    msg "Updating etc/profile.d/${pkgname}.sh..."
    install -D -m 755 ${srcdir}/profile.sh \
       ${pkgdir}/etc/profile.d/${pkgname}.sh || return 1
    sed \
        -e "s|DESTINATION|${DESTINATION}|g" \
        -e "s|INTELARCH|${_intel_arch2}|g" \
        -e "s|PKGNAME|${pkgname}|g" \
        -i ${pkgdir}/etc/profile.d/${pkgname}.sh || return 1

    msg "Copying release notes..."
    _COMP=`echo "${_comp}" | tr "[a-z]" "[A-Z]"`
    _release_notes=`find . -name *Release_Notes*en*`
    if [[ "$_release_notes" != "" ]]; then
        install -D -m 644 \
            $_release_notes \
            ${pkgdir}${DESTINATION}/Release_Notes.pdf || return 1
    fi
    rm -f ${pkgdir}/usr/share/licenses/$pkgname/*.lic || return 1

    msg "Installing license..."
    install -D -m 644 \
        ${srcdir}/${_archive_arch}/license.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    msg "Updating ${pkgname}.install to edit ld.so.conf correctly..."
    #sed -e "s|.*ntel/Compiler.*||g" /etc/ld.so.conf
    sed \
        -e "s#echo \".*#echo \"${DESTINATION}/lib\" >> /etc/ld.so.conf#g" \
        -e "s#sed -i \".*#sed -i \"s|.*ntel/Compiler.*||g\" /etc/ld.so.conf#g" \
        -i ${startdir}/${pkgname}.install \
        || return 1

    msg "Fix namcap reported errors/warnings..."
    #### Fix "icc W: Library ([...]) does not have permission set to 644."
    find ${pkgdir}${DESTINATION} -name *.a -exec chmod 0644 {} \;
#     chmod 755 ${pkgdir}${DESTINATION}/mkl/tools/environment/*
#     chmod 644 ${pkgdir}${DESTINATION}/mkl/tools/plugins/com.intel.mkl.help/*
#     chmod 644 ${pkgdir}${DESTINATION}/mkl/tools/builder/*

    #### Fix ""
    # Remove ${pkgdir} from symbolic link target
    change_link ${pkgdir}${DESTINATION}/idb/gui/${_intel_arch2}/plugins/com.intel.debugger.help_1.0.0
    change_link ${pkgdir}${DESTINATION}/tbb/lib/ia32
    #change_link ${pkgdir}${DESTINATION}/tbb/lib/emt64
    [[ "$CARCH" = "x86_64" ]] && change_link ${pkgdir}${DESTINATION}/tbb/lib/intel64
    change_link ${pkgdir}${DESTINATION}/tbb/bin/ia32
    #change_link ${pkgdir}${DESTINATION}/tbb/bin/emt64
    [[ "$CARCH" = "x86_64" ]] && change_link ${pkgdir}${DESTINATION}/tbb/bin/intel64

    #### Fix "icc W: Potential non-FHS man page ([...]) found."
    # Delete japanese man pages
    rm -fr ${pkgdir}${DESTINATION}/man/ja_JP
    # Move (english) man pages to FHS location
    mkdir -p ${pkgdir}/usr/share/man
    mv ${pkgdir}${DESTINATION}/man/en_US/man1 ${pkgdir}/usr/share/man/
#     mv ${pkgdir}${DESTINATION}/man/en_US/man3 ${pkgdir}/usr/share/man/
    rm -fr ${pkgdir}${DESTINATION}/man
    ln -s /usr/share/man/ ${pkgdir}${DESTINATION}/man

    #### Fix "icc E: Symlink ([...]) points to non-existing ./[...]"
    #cd ${pkgdir}${DESTINATION}/ipp/em64t/sharedlib
#     for f in `find ${pkgdir}${DESTINATION}/ipp/em64t/sharedlib/ -type l`; do
#         #\ls -l $f
#         link=`\ls -l $f  | sed -e "s|.* -> ./\(.*\)|\1|g"`
#         rm -f $f
#         ln -s ${DESTINATION}/ipp/em64t/sharedlib/$link $f
#     done

    # Namcap also reports "insecure rpath" for these files:
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ia32/xhpl_ia32_dynamic). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ia32/xhpl_hybrid_ia32_dynamic). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ia32/xhpl_ia32). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ia32/xhpl_hybrid_ia32). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ipf/xhpl_hybrid_ipf). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ipf/xhpl_ipf_dynamic). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ipf/xhpl_hybrid_ipf_dynamic). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/ipf/xhpl_ipf). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/em64t/xhpl_em64t). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/em64t/xhpl_em64t_dynamic). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/em64t/xhpl_hybrid_em64t_dynamic). If present, RPATH should be only /usr/lib.
    #icc        E: Insecure RPATH (opt/intel/Compiler/11.1/046/mkl/benchmarks/mp_linpack/bin_intel/em64t/xhpl_hybrid_em64t). If present, RPATH should be only /usr/lib.
    # but nothing can be done...

    #msg "##################################################"
    #msg "Package creation finished."
    #msg "NOTE: ICC is not compatible with GCC 4.4. Installing"
    #msg "      a previous gcc release is highly recommended."
    #msg "Press any key to continue..."
    #msg "##################################################"
    #read -p " "
}
