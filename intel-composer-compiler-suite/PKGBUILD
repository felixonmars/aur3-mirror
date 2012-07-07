# Contributor: simone riva: siomone.rva -a- gmail com
# Intel C++ Composer XE 2011 for Linux - ( Intel compiler icc suite )
##########################################################################
# this PKGBUILD splits the main composer packege in 7 sub-packages:
#
# intel-compiler-base:  Intel C/C++ compiler and base libs
# intel-openmp:         Intel OpenMP Library
# intel-idb:            Intel C/C++ debugger
# intel-ipp:            Intel Integrated Performance Primitives
# intel-mkl:            Intel Math Kernel Library (Intel® MKL)
# intel-sourcechecker:  Intel Source Checker
# intel-tbb:            Intel Threading Building Blocks (TBB)
###########################################################################

# Composer XE PKGBUILD
#     Copyright (C) 2011   Simone Riva
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


pkgname=('intel-composer-compiler-suite')
true && pkgname=('intel-compiler-base' 'intel-openmp' 'intel-idb' 'intel-ipp' 'intel-mkl' 'intel-sourcechecker' 'intel-tbb' )
#true && pkgname=('intel-compiler-base' 'intel-openmp' 'intel-tbb')

PKGEXT='.pkg.tar.gz'

########################################
#OPTIONS begin
# if you are using an AMD 64 cpu set this variable to true, leave it to false if you use an ia32, amd32 or intel64
_amd_64=false 

# set to true if you want to remove documentations and examples form the packages.
_remove_docs=false
########################################


_year='2011'
_v_a='11'
_v_b='339' 

pkgrel=1
_dir_nr='2670'

_sp='sp1'

pkgver=${_year}.${_v_a}.${_v_b}


options=(strip)


_icc_ver='12.1'
_ipp_ver='7.0-7'
_mkl_ver='10.3-11'
_openmp_ver='12.1-11'
_sourcechecker_ver='12.1-11'

_tbb_ver='4.0-5'
_tbb_arch='cc4.1.0_libc2.4_kernel2.6.16.21'
_tbb_not_arch='cc3.4.3_libc2.3.4_kernel2.6.9'

_composer_xe_dir="composer_xe_${_year}_${_sp}.${_v_a}.${_v_b}"



if $_amd_64 ; then
  _not_arch_64='intel64'
else
  _not_arch_64='ia64' 
fi



url="http://software.intel.com/en-us/articles/non-commercial-software-download/"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('libarchive' 'sed')

source=('icc.sh' 
	'intel-compiler-base.conf' 
	'intel-openmp.conf'
	'intel-mkl.conf' 
	'intel-idb.conf'
	'intel-ipp.conf'
	'intel-tbb.conf'
	)

md5sums=( '350cda09cb0081663d86fc488cc89eef' 
	  'a596377b7661bbfef73746cae894be02' 
	  '2b1628f30b0d68de194d3ce328be79bc' 
	  '6e933eacc2edae0d73567f72439d471f' 
	  'b3c65f74f37cd32a5262cf1efc3acdbe'
	  '51c46449f6301d9d05275eb07e3ac23e'
	  '0b5904975b2427457df50b7091554c8b'
	)


#_archive=l_ccompxe${_comp}_p_${pkgver}
if [ "$CARCH" = "i686" ]; then
    _i_arch='ia32'
    _i_arch2='i486'
    _not_arch='intel64'
    md5sums=('2b9ec6e9f14ef07c75ee31d4e9c07618' ${md5sums[@]} )
else
    _i_arch='intel64'
  
    _i_arch2='x86_64'
    _not_arch='ia32' 
    md5sums=('49ccee4035a68c0fd053cbb880676684' ${md5sums[@]} )
fi

source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/${_dir_nr}/l_ccompxe_${_i_arch}_${pkgver}.tgz" ${source[@]})

build() {

	echo "-----------------------------------------------------------------------------"
	echo " This PKGBUILD splits the main composer package in 7 sub-packages:"
	echo ""
	echo " intel-compiler-base:  Intel C/C++ compiler and base libs"
	echo " intel-openmp:         Intel OpenMP Library"
	echo " intel-idb:            Intel C/C++ debugger"
	echo " intel-ipp:            Intel Integrated Performance Primitives"
	echo " intel-mkl:            Intel Math Kernel Library (Intel® MKL)"
	echo " intel-sourcechecker:  Intel Source Checker"
	echo " intel-tbb:            Intel Threading Building Blocks (TBB)"
	echo "-----------------------------------------------------------------------------"
	echo "" 
	echo "-----------------------------------------------------------------------------"
	echo "For having a minimal working environment you must install the packages:"
	echo " intel-compiler-base       intel-openmp "
	echo "-----------------------------------------------------------------------------"
	echo "" 
	echo "-----------------------------------------------------------------------------"
	echo " WIKI: https://wiki.archlinux.org/index.php/Intel_C%2B%2B"
	echo "-----------------------------------------------------------------------------"
	echo "" 
	echo "-----------------------------------------------------------------------------"
	echo " Github: https://github.com/simon-r/intel_composer_pkgbuild" 
	echo "-----------------------------------------------------------------------------"

	mkdir -p ${srcdir}/etc/profile.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../icc.sh > ${srcdir}/etc/profile.d/icc.sh
	else
	  sed 's/<arch>/intel64/' < ../icc.sh > ${srcdir}/etc/profile.d/icc.sh
	fi

	sed -i 's/<tbb_arch>/cc4\.1\.0_libc2\.4_kernel2\.6\.16\.21/' ${srcdir}/etc/profile.d/icc.sh

	chmod a+x ${srcdir}/etc/profile.d/icc.sh

	mkdir -p ${srcdir}/etc/ld.so.conf.d

	_cnt=0
	for f in ../*.lic ; do
	  _lic_file[_cnt]=$f
	  _cnt=$(($_cnt+1))
	done

	if [[ ! -f "${_lic_file[0]}" ]]; then
	  echo ""
	  echo "-----------------------------------------------------------------------------------"
	  echo "ERROR: license file not foud!"
	  echo "To continue this procedure you must obtain an original license file from Intel"
	  echo "that must be copied in the PKGBUILD directory"
	  echo "visit:  http://software.intel.com/en-us/articles/non-commercial-software-download/"
	  echo "-----------------------------------------------------------------------------------"
	  return 1 ;
	fi

	mkdir -p ${srcdir}/opt/intel/licenses
	cp ../*.lic ${srcdir}/opt/intel/licenses

	cp ${srcdir}/l_ccompxe_${_i_arch}_${pkgver}/license ${srcdir}/opt/intel/license.txt
	cp ${srcdir}/l_ccompxe_${_i_arch}_${pkgver}/license_jp ${srcdir}/opt/intel/license_jp.txt
	cp ${srcdir}/l_ccompxe_${_i_arch}_${pkgver}/support.txt ${srcdir}/opt/intel/

	echo ""
	echo "-----------------------------------------------------------------------------------"
	echo "IMPORTANT - READ BEFORE COPYING, INSTALLING, OR USING."
	echo ""
	echo "Do not copy, install, or use the \"Materials\" provided under this license agreement (\"Agreement\"), until you"
	echo "have carefully read the following terms and conditions."
	echo ""
	echo "By copying, installing, or otherwise using the Materials, you agree to be bound by the terms of this" 
	echo "Agreement. If you do not agree to the terms of this Agreement, do not copy, install, or use the Materials."
	echo " - A copy of the EULA has been copied in the PKGBUILD directory; plase read carefully the terms and "
	echo " - conditions of the Intel license before installing the packages. "
	echo "-----------------------------------------------------------------------------------"
	echo ""
	echo "-----------------------------------------------------------------------------------"
	echo " ATTENTION: This PKGBUILD may need up to 20 minutes if you use XZ as a compressor!"
	echo "    - The build of the packages: intel-mkl and intel-ipp is particularly slow - "
	echo "-----------------------------------------------------------------------------------"
	echo ""
	echo ""
	echo "-----------------------------------------------------------------------------------"
	echo -e " \e[1m\e[5mATTENTION: \e[0m \e[1m\e[31mThis PKGBUILD don't work with yaourt! \e[0m "
	echo " You must use the makepkg command for building this package"
	echo "-----------------------------------------------------------------------------------"
	echo ""

	cd ${srcdir}/opt/intel
	ln -s ./${_composer_xe_dir} composerxe-${_year}
	ln -s ./composerxe-${_year} composerxe

	ln -s ./composerxe/bin/${_i_arch} bin
	ln -s ./composerxe/bin pkg_bin

	ln -s ./composerxe/ipp/ ipp
	ln -s ./composerxe/compiler/lib/${_i_arch} lib
	ln -s ./composerxe/debugger/lib/${_i_arch} debugger_lib
	ln -s ./composerxe/man/ man
	ln -s ./composerxe/mkl/ mkl
	ln -s ./composerxe/tbb/ tbb
	
	_current_dir=`pwd`
	if [ -d ${pkgdir}/opt ] ; then
	  cd ${pkgdir}
	  rm -rf opt
	  cd $_current_dir
	fi ;	
}

package_intel-compiler-base() {
	pkgdesc="Intel C/C++ compiler"
	pkgver=${_year}.${_v_a}.${_v_b}
	install=intel-composer.install

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/profile.d

	cp ../intel-compiler-base.conf ${srcdir}/etc/ld.so.conf.d

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-compilerpro-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-compilerpro-devel-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-compilerpro-vars-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-compilerproc-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-compilerproc-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-compilerproc-devel-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/bin

	rm uninstall.sh
	rm *.csh

	for f in *.sh ; do
	  sed -i 's/<PRODDIR>/\/opt\/intel/g' $f
	  sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' $f
	done 

	cd $_i_arch
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' loopprofileviewer.sh
	chmod a+x loopprofileviewer.sh
	rm loopprofileviewer.csh

	if $_remove_docs ; then
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Samples
	fi

	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/etc ${pkgdir}
}

package_intel-idb() {
	pkgdesc="Intel C/C++ debugger"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/ld.so.conf.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-idb.conf > ${srcdir}/etc/ld.so.conf.d/intel-idb.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-idb.conf > ${srcdir}/etc/ld.so.conf.d/intel-idb.conf
	fi

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-idb-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-idb-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-idbcdt-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/bin
	rm idbvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idbvars.sh

	cd $_i_arch
	rm idbvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idbvars.sh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idb
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idbc

	if $_remove_docs ; then
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	fi

	mv ${srcdir}/opt ${pkgdir}
	
	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

package_intel-ipp() {
	pkgdesc="Intel Integrated Performance Primitives"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	mkdir -p ${srcdir}/opt

	mkdir -p ${srcdir}/etc/ld.so.conf.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-ipp.conf > ${srcdir}/etc/ld.so.conf.d/intel-ipp.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-ipp.conf > ${srcdir}/etc/ld.so.conf.d/intel-ipp.conf
	fi

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-ipp-${_sp}-common-${_v_b}-${_ipp_ver}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-ipp-${_sp}-${_v_b}-${_ipp_ver}.${_i_arch2}.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-ipp-${_sp}-devel-${_v_b}-${_ipp_ver}.${_i_arch2}.rpm

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/ipp/bin
	rm ippvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' ippvars.sh

	cd $_i_arch
	rm ippvars_${_i_arch}.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' ippvars_${_i_arch}.sh

        # remove the unneeded and problematic ipp_minigzip and ipp_gzip
	for _z_dir_name in 'ipp_zlib' 'ipp_gzip' 'ipp_bzip2'  ; do
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/ipp/interfaces/data-compression/${_z_dir_name}/bin/${_not_arch}
	done

	if $_remove_docs ; then
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	fi

	mv ${srcdir}/opt ${pkgdir}

	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

package_intel-mkl() {
	pkgdesc="Intel Math Kernel Library (Intel® MKL) "
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/ld.so.conf.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-mkl.conf > ${srcdir}/etc/ld.so.conf.d/intel-mkl.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-mkl.conf > ${srcdir}/etc/ld.so.conf.d/intel-mkl.conf
	fi

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-mkl-${_sp}-common-${_v_b}-${_mkl_ver}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-mkl-${_sp}-${_v_b}-${_mkl_ver}.${_i_arch2}.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-mkl-${_sp}-devel-${_v_b}-${_mkl_ver}.${_i_arch2}.rpm

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/bin
	rm mklvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' mklvars.sh

	rm -rf ./${_not_arch}

	cd $_i_arch
	rm mklvars_${_i_arch}.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' mklvars_${_i_arch}.sh

	if $_remove_docs ; then
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/examples
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/benchmarks
	fi

	mv ${srcdir}/opt ${pkgdir}

	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

package_intel-openmp() {
	pkgdesc="Intel OpenMP Library"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	mkdir -p ${srcdir}/opt

	mkdir -p ${srcdir}/etc/ld.so.conf.d
	cp ../intel-openmp.conf ${srcdir}/etc/ld.so.conf.d

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-openmp-${_v_b}-${_openmp_ver}.${_i_arch2}.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-openmp-devel-${_v_b}-${_openmp_ver}.${_i_arch2}.rpm

	mv ${srcdir}/opt ${pkgdir}

	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

package_intel-sourcechecker() {
	pkgdesc="Intel Source Checker"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')

	mkdir -p ${srcdir}/opt

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-sourcechecker-common-${_v_b}-${_sourcechecker_ver}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-sourcechecker-devel-${_v_b}-${_sourcechecker_ver}.${_i_arch2}.rpm

	mv ${srcdir}/opt ${pkgdir}
}

package_intel-tbb() {
	pkgdesc="Intel Threading Building Blocks (TBB)"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-tbb.install

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/ld.so.conf.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/${_i_arch}/' < ../intel-tbb.conf > ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	  sed -i 's/<tbb_arch>/cc4\.1\.0_libc2\.4_kernel2\.6\.16\.21/' ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	else
	  sed 's/<arch>/${_i_arch_tbb}/' < ../intel-tbb.conf > ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	  sed -i 's/<tbb_arch>/cc4\.1\.0_libc2\.4_kernel2\.6\.16\.21/' ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	fi

	cd ${srcdir}
	
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-tbb-${_sp}-${_v_b}-${_tbb_ver}.noarch.rpm
	bsdtar -xf  l_ccompxe_${_i_arch}_${pkgver}/rpms/intel-tbb-${_sp}-devel-${_v_b}-${_tbb_ver}.noarch.rpm

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin
	rm tbbvars.csh

	sed -i 's/SUBSTITUTE_INSTALL_DIR_HERE/\/opt\/intel\/composerxe\/tbb/g' tbbvars.sh

	sed -i 's/SUBSTITUTE_IA32_ARCH_HERE/\"cc4\.1\.0_libc2\.4_kernel2\.6\.16\.21\"/g' tbbvars.sh
	sed -i 's/SUBSTITUTE_IA64_ARCH_HERE/\"cc4\.1\.0_libc2\.4_kernel2\.6\.16\.21\"/g' tbbvars.sh
	sed -i 's/SUBSTITUTE_INTEL64_ARCH_HERE/\"cc4\.1\.0_libc2\.4_kernel2\.6\.16\.21\"/g' tbbvars.sh
	chmod a+x tbbvars.sh

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin
	#rm tbbvars.csh
	sed -i 's/SUBSTITUTE_INSTALL_DIR_HERE/\/opt\/intel\/composerxe\/tbb/g' tbbvars.sh
	chmod a+x tbbvars.sh

	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin/${_not_arch}
	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin/${_not_arch_64}
	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin/${_i_arch}/${_tbb_not_arch}

	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/lib/${_not_arch}
	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/lib/${_not_arch_64}
	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/lib/${_i_arch}/${_tbb_not_arch}

	if $_remove_docs ; then
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/examples
	fi

	mv ${srcdir}/opt ${pkgdir}
	
	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

pkgdesc="Intel C++ Composer XE 2011 for Linux - ( Intel compiler icc suite )"
depends=('bash' 'gcc')
