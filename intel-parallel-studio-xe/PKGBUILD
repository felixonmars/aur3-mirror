# Contributor: simone riva: siomone.rva -a- gmail com
# Intel Parallel Studio XE 2011 for Linux - ( Intel compiler icc suite )
##########################################################################
# this PKGBUILD splits the main Parallel Studio XE packege in 8 sub-packages:
#
# intel-compiler-base:          Intel C/C++ compiler and base libs
# intel-fortran-compiler:       Intel fortran compiler and base libs"
# intel-openmp:                 Intel OpenMP Library
# intel-idb:                    Intel C/C++ debugger
# intel-ipp:                    Intel Integrated Performance Primitives
# intel-mkl:                    Intel Math Kernel Library (Intel® MKL)
# intel-sourcechecker:          Intel Source Checker
# intel-tbb:                    Intel Threading Building Blocks (TBB)
###########################################################################

# Parallel Studio XE
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


pkgname=('intel-parallel-studio-xe')
true && pkgname=('intel-compiler-base' 'intel-openmp' 'intel-fortran-compiler' 'intel-idb' 'intel-ipp' 'intel-mkl' 'intel-sourcechecker' 'intel-tbb' )
#true && pkgname=('intel-compiler-base'  'intel-mkl')

PKGEXT='.pkg.tar.gz'

########################################
#OPTIONS begin
# if you are using an AMD 64 cpu set this variable to true, leave it to false if you use an ia32, amd32 or intel64
_amd_64=false 

# set to true if you want to remove documentations and examples form the packages.
_remove_docs=true

_remove_static_objects=true
########################################


_year='2013'
_v_a='0'
_v_b='079' 

_update=''

pkgrel=2

_sp=''

pkgver=${_year}.${_v_a}.${_v_b}

_dir_nr='2749'

options=(strip)


_icc_ver='13.0'
_ipp_ver='7.1-0'
_mkl_ver='11.0-0'
_openmp_ver='13.0-0'
_sourcechecker_ver='13.0-0'

_tbb_ver='4.1-0'




if $_amd_64 ; then
  _not_arch_64='intel64'
else
  _not_arch_64='ia64' 
fi



url="http://software.intel.com/en-us/articles/non-commercial-software-download/"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('libarchive' 'sed' 'gzip')

source=('icc.sh' 
	'intel-composer.install'
	'intel-compiler-base.conf' 
	'intel-fortran.conf'
	'intel-openmp.conf'
	'intel-mkl.conf' 
	'intel-idb.conf'
	'intel-ipp.conf'
	'intel-tbb.conf'
	'intel-mkl.sh'
        'intel-mkl.install'
        'intel-mkl-th.conf'
	'intel-tbb.install'
	'EULA.txt'
	)

sha256sums=( 
	'338041f924d8f3ac31d349bca57f8ab66f094a5bb53d4f821f48fa710a112111' 
	'b7e1a3849c62f293245221d7ab5ee35c0e737b90b3eb4ae83c1eb41023d4e3ec'
	'31ac4d0f30a93fe6393f48cb13761d7d1ce9719708c76a377193d96416bed884' 
	'c165386ba33b25453d4f5486b7fefcdba7d31e156ad280cbdfa13ed924b01bef'
	'99cc9683cc75934cc21bb5a09f6ad83365ee48712719bfd914de9444695eed13' 
	'a856326362e9b80c19dc237cbf66bf3d96a69bd7ad1baff99ec9849f8208348c' 
	'976de24a127e1f43b1b2696ac3aef9fe03cb26b9bcf81126c73ffc751b2604d5'
	'da6f41c2e002c9a793c75a18c8d1c85ef7ef5bf83a7a0a158ff144481491aac8'
	'335307bc002d4b7e4a05ef382599a24465562ff98e980d087b7c5ac9c7ed8763'
	'5e68c529c65cac54218026c869e54b2ddb268179725fc1e6b56d920470dad999'
	'bfd7daab7518a63f322fa011a84ea210e0bbc14f0bfacfaa16d477513c35c950'
        'e515cb28bf40cdb0db818db6a2688a0028575153a1b9d5acfb0bc5f13fe45722'
	'8c6a1f7b1b12d498e68b3085d8b2fcd050505209b7c0f2b870ba5f65ee135a90'
	'228ac25e147adb9b872e1a562e522d2fd48809ccae89b765112009896a6d55a5'
	)


#_archive=l_ccompxe${_comp}_p_${pkgver}
if [ "$CARCH" = "i686" ]; then
    _i_arch='ia32'
    _i_arch2='i486'
    _not_arch='intel64'
    sha256sums=( '3f0ff2ece4cfc5ec3d7c2fddefeda2b55b1295a0d62440c172a14d8e60b7b551' ${sha256sums[@]} )
else
    _i_arch='intel64'
  
    _i_arch2='x86_64'
    _not_arch='ia32' 
    sha256sums=('6d3f5a635e86bc6d71d970458d746df8f4f239e8892347d76b4eda18946048f3' ${sha256sums[@]} )
fi

_composer_xe_dir="composer_xe_${_year}.${_v_a}.${_v_b}"
_parallel_studio_xe_dir="parallel_studio_xe_${_year}_${_i_arch}"

_man_dir=${srcdir}/usr/share/man/man1/


source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/${_dir_nr}/${_parallel_studio_xe_dir}.tgz" ${source[@]})

build() {

	echo -e "-----------------------------------------------------------------------------"
	echo -e " This PKGBUILD splits the main \e[1mParallel Studio XE\e[0m package in 8 sub-packages:"
	echo -e ""
	echo -e " \e[1mintel-compiler-base:\e[0m          Intel C/C++ compiler and base libs"
	echo -e " \e[1mintel-fortran-compiler:\e[0m       Intel fortran compiler and base libs"
	echo -e " \e[1mintel-openmp:\e[0m                 Intel OpenMP Library"
	echo -e " \e[1mintel-idb:\e[0m                    Intel C/C++ debugger"
	echo -e " \e[1mintel-ipp:\e[0m                    Intel Integrated Performance Primitives"
	echo -e " \e[1mintel-mkl:\e[0m                    Intel Math Kernel Library (Intel® MKL)"
	echo -e " \e[1mintel-sourcechecker:\e[0m          Intel Source Checker"
	echo -e " \e[1mintel-tbb:\e[0m                    Intel Threading Building Blocks (TBB)"
	echo -e "-----------------------------------------------------------------------------"
	echo -e "" 
	echo -e "-----------------------------------------------------------------------------"
	echo -e "For having a minimal working environment you must install the packages:"
	echo -e " intel-compiler-base       intel-openmp "
	echo -e "-----------------------------------------------------------------------------"
	echo -e "" 
	echo -e "-----------------------------------------------------------------------------"
	echo -e "\e[1mWIKI: \e[0m https://wiki.archlinux.org/index.php/Intel_C%2B%2B"
	echo -e "-----------------------------------------------------------------------------"
	echo -e "" 
	echo -e "-----------------------------------------------------------------------------"
	echo -e "\e[1mGithub: \e[0m https://github.com/simon-r/intel-parallel-studio-xe" 
	echo -e "-----------------------------------------------------------------------------"

	if [ -d ${srcdir}/opt/intel ] ; then
	  rm -rf ${srcdir}/opt/intel
	fi

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
	  echo -e ""
	  echo -e "-----------------------------------------------------------------------------------"
	  echo -e "\e[1mERROR:\e[0m license file not foud!"
	  echo -e "To continue this procedure you must obtain an original license file from Intel"
	  echo -e "that must be copied in the PKGBUILD directory"
	  echo -e "visit:  http://software.intel.com/en-us/articles/non-commercial-software-download/"
	  echo -e "-----------------------------------------------------------------------------------"
	  return 1 ;
	fi

	mkdir -p ${srcdir}/opt/intel/licenses
	cp ../*.lic ${srcdir}/opt/intel/licenses

	cp ${srcdir}/${_parallel_studio_xe_dir}/license.txt ${srcdir}/opt/intel/license.txt
	
	echo -e ""
	echo -e "-----------------------------------------------------------------------------------"
	echo -e "\e[1mIMPORTANT - READ BEFORE COPYING, INSTALLING, OR USING.\e[0m"
	echo -e ""
	echo -e "Do not copy, install, or use the \"Materials\" provided under this license agreement (\"Agreement\"), until you"
	echo -e "have carefully read the following terms and conditions."
	echo -e ""
	echo -e "By copying, installing, or otherwise using the Materials, you agree to be bound by the terms of this" 
	echo -e "Agreement. If you do not agree to the terms of this Agreement, do not copy, install, or use the Materials."
	echo -e " - A copy of the EULA has been copied in the PKGBUILD directory; plase read carefully the terms and "
	echo -e " - conditions of the Intel license before installing the packages. "
	echo -e "-----------------------------------------------------------------------------------"
	echo -e ""
	echo -e "-----------------------------------------------------------------------------------"
	echo -e " ATTENTION: This PKGBUILD may need up to 20 minutes if you use XZ as a compressor!"
	echo -e "    - The build of the packages: intel-mkl and intel-ipp is particularly slow - "
	echo -e "-----------------------------------------------------------------------------------"
	echo -e ""
	echo -e ""
	echo -e "-----------------------------------------------------------------------------------"
	echo -e " \e[1m\e[5mATTENTION: \e[0m \e[1m\e[31mThis PKGBUILD don't work with yaourt! \e[0m "
	echo -e " You must use the makepkg command for building this package"
	echo -e "-----------------------------------------------------------------------------------"
	echo -e ""
	echo -e ""
	echo -e "-----------------------------------------------------------------------------------"
	echo -e "\e[1m -- Options: -- \e[0m"
	if  ${_remove_docs} ; then
	  echo -e " Remove Documentation: YES "
	else
	  echo -e " Remove Documentation: NO "
	fi

	if  ${_remove_static_objects} ; then
	  echo -e "\e[1m Remove Static Objects: YES \e[0m "
	else
	  echo -e " Remove Static Objects: NO "
	fi
	echo -e "-----------------------------------------------------------------------------------"
	echo -e ""
	echo -e ""


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
	
	echo -e " # intel_compiler-base: Start Building" 

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/profile.d
	mkdir -p ${_man_dir}


	cp ../intel-compiler-base.conf ${srcdir}/etc/ld.so.conf.d

	cd ${srcdir}
	echo -e " # intel_compiler-base: Extracting RPMS" 
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerpro-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerpro-devel-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerpro-vars-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerproc-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerproc-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerproc-devel-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	
	echo -e " # intel_compiler-base: Editing variables" 
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
	  echo -e " # intel_compiler-base: Remove docs" 
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Samples
	fi

	echo -e " # intel_compiler-base: Coping man pages" 
        mv ${srcdir}/opt/intel/${_composer_xe_dir}/man/en_US/man1/*.1 ${srcdir}/usr/share/man/man1/

	cd ${_man_dir}
	for f in *.1 ; do
	  gzip $f
	done

	cd ${srcdir}

	echo -e " # intel_compiler-base: Move package"
	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/etc ${pkgdir}
	mv ${srcdir}/usr ${pkgdir}
}


package_intel-fortran-compiler() {
	pkgdesc="Intel Fortran compiler"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	echo -e " # intel-fortran-compiler: Start Building" 

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/profile.d
	mkdir -p ${srcdir}/etc/ld.so.conf.d
	mkdir -p ${_man_dir}

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-fortran.conf > ${srcdir}/etc/ld.so.conf.d/intel-fortran.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-fortran.conf > ${srcdir}/etc/ld.so.conf.d/intel-fortran.conf
	fi

	cd ${srcdir}
	
	echo -e " # intel-fortran-compiler: Extracting RPMS" 
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerprof-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerprof-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-compilerprof-devel-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm


	echo -e " # intel-fortran-compiler: Editing variables"
	cd ${srcdir}/opt/intel/${_composer_xe_dir}/bin

	rm *.csh

	rm ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation/en_US/gs_resources/intel_logo.gif

	if $_remove_docs ; then
	  echo -e " # intel-fortran-compiler: Remove documentation"
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Samples
	fi

	echo -e " # intel-fortran-compiler: Coping man pages"
        mv ${srcdir}/opt/intel/${_composer_xe_dir}/man/en_US/man1/*.1 ${srcdir}/usr/share/man/man1/

	cd ${_man_dir}
	for f in *.1 ; do
	  gzip $f
	done

	cd ${srcdir}
	
	echo -e " # intel-fortran-compiler: Move package"
	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/etc ${pkgdir}
	mv ${srcdir}/usr ${pkgdir}
}

package_intel-idb() {
	pkgdesc="Intel C/C++ debugger"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install
	echo -e " # intel-idb: Start Building"

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/ld.so.conf.d
	mkdir -p ${_man_dir}

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-idb.conf > ${srcdir}/etc/ld.so.conf.d/intel-idb.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-idb.conf > ${srcdir}/etc/ld.so.conf.d/intel-idb.conf
	fi

	cd ${srcdir}
	
	echo -e " # intel-idb: Extracting RPS"
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-idb-common-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-idb-${_v_b}-${_icc_ver}-${_v_a}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-idbcdt-${_v_b}-${_icc_ver}-${_v_a}.noarch.rpm

	echo -e " # intel-idb: Editing variables"
	cd ${srcdir}/opt/intel/${_composer_xe_dir}/bin
	rm idbvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idbvars.sh

	cd $_i_arch
	rm idbvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idbvars.sh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idb
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' idbc

	if $_remove_docs ; then
	  echo -e " # intel-idb: Remove documentation"
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	fi

	echo -e " # intel-idb: Coping man pages"
	mv ${srcdir}/opt/intel/${_composer_xe_dir}/man/en_US/man1/*.1 ${srcdir}/usr/share/man/man1/

	cd ${_man_dir}
	for f in *.1 ; do
	  gzip $f
	done

	cd ${srcdir}

	echo -e " # intel-idb: Move package"
	mv ${srcdir}/opt ${pkgdir}
	
	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
	mv ${srcdir}/usr ${pkgdir}
}

package_intel-ipp() {
	pkgdesc="Intel Integrated Performance Primitives"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	echo -e " # intel-ipp: Start Building"

	mkdir -p ${srcdir}/opt

	mkdir -p ${srcdir}/etc/ld.so.conf.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-ipp.conf > ${srcdir}/etc/ld.so.conf.d/intel-ipp.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-ipp.conf > ${srcdir}/etc/ld.so.conf.d/intel-ipp.conf
	fi

	cd ${srcdir}
	echo -e " # intel-ipp: Extracting RPMS"
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-ipp-common-${_v_b}-${_ipp_ver}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-ipp-${_v_b}-${_ipp_ver}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-ipp-devel-${_v_b}-${_ipp_ver}.${_i_arch2}.rpm

	echo -e " # intel-ipp: Editing variables"
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

	if ${_remove_docs} ; then
	  echo -e " # intel-ipp: Remove documentation"
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	fi

	if ${_remove_static_objects} ; then
	  echo -e " # intel-ipp: Remove static objects"
	  rm -f ${srcdir}/opt/intel/${_composer_xe_dir}/ipp/lib/${_i_arch}/libipp*.a
	  rm -f ${srcdir}/opt/intel/${_composer_xe_dir}/ipp/lib/${_i_arch}/nonpic/libipp*.a
	  rmdir ${srcdir}/opt/intel/${_composer_xe_dir}/ipp/lib/${_i_arch}/nonpic/
	fi

	echo -e " # intel-ipp: Move package"
	mv ${srcdir}/opt ${pkgdir}

	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

package_intel-mkl() {
	pkgdesc="Intel Math Kernel Library (Intel® MKL) "
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-mkl.install
	backup=('etc/intel-mkl-th.conf')

	echo -e " # intel-mkl: Start Building"

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/ld.so.conf.d
	
	mkdir -p ${srcdir}/etc/profile.d

	cp ../intel-mkl.sh ${srcdir}/etc/profile.d
	chmod a+x ${srcdir}/etc/profile.d/intel-mkl.sh

	cp ../intel-mkl-th.conf ${srcdir}/etc/

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-mkl.conf > ${srcdir}/etc/ld.so.conf.d/intel-mkl.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-mkl.conf > ${srcdir}/etc/ld.so.conf.d/intel-mkl.conf
	fi

	cd ${srcdir}
	
	echo -e " # intel-mkl: Extracting RPMS"
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-mkl-common-${_v_b}-${_mkl_ver}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-mkl-${_v_b}-${_mkl_ver}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-mkl-devel-${_v_b}-${_mkl_ver}.${_i_arch2}.rpm

	echo -e " # intel-mkl: Editing variables"
	cd ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/bin
	rm mklvars.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' mklvars.sh

	rm -rf ./${_not_arch}

	cd $_i_arch
	rm mklvars_${_i_arch}.csh
	sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' mklvars_${_i_arch}.sh

	if ${_remove_docs} ; then
	  echo -e " # intel-mkl: remove documentation"
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/examples
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/benchmarks
	fi

	if ${_remove_static_objects} ; then
	  echo -e " # intel-mkl: remove static objects"
	  rm -f ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/lib/${_i_arch}/libmkl_*.a
	  rm -f ${srcdir}/opt/intel/${_composer_xe_dir}/mkl/lib/mic/libmkl_*.a
	fi

	echo -e " # intel-mkl: Move package"
	mv ${srcdir}/opt ${pkgdir}

	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
	mv ${srcdir}/etc/intel-mkl-th.conf ${pkgdir}/etc
}

package_intel-openmp() {
	pkgdesc="Intel OpenMP Library"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-composer.install

	echo -e " # intel-openmp: Start Building"

	mkdir -p ${srcdir}/opt

	mkdir -p ${srcdir}/etc/ld.so.conf.d
	cp ../intel-openmp.conf ${srcdir}/etc/ld.so.conf.d

	cd ${srcdir}
	
	echo -e " # intel-openmp: Extracting RPMS"
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-openmp-${_v_b}-${_openmp_ver}.${_i_arch2}.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-openmp-devel-${_v_b}-${_openmp_ver}.${_i_arch2}.rpm

	
	if ${_remove_static_objects} ; then
	   echo -e " # intel-openmp: Remove static objects"
	  rm -f ${srcdir}/opt/intel/${_composer_xe_dir}/compiler/lib/${_i_arch}/lib*.a
	  rm -f ${srcdir}/opt/intel/${_composer_xe_dir}/compiler/lib/mic/lib*.a
	fi	

	echo -e " # intel-openmp: Move package"
	mv ${srcdir}/opt ${pkgdir}

	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

package_intel-sourcechecker() {
	pkgdesc="Intel Source Checker"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')

	echo -e " # intel-sourcechecker: Start building"

	mkdir -p ${srcdir}/opt

	cd ${srcdir}
	
	echo -e " # intel-sourcechecker: Extracting RPMS"
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-sourcechecker-common-${_v_b}-${_sourcechecker_ver}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-sourcechecker-devel-${_v_b}-${_sourcechecker_ver}.${_i_arch2}.rpm

	echo -e " # intel-sourcechecker: Move package"
	mv ${srcdir}/opt ${pkgdir}
}

package_intel-tbb() {
	pkgdesc="Intel Threading Building Blocks (TBB)"
	pkgver=${_year}.${_v_a}.${_v_b}
	depends=('intel-compiler-base')
	install=intel-tbb.install

	echo -e " # intel-tbb: Start Building "

	mkdir -p ${srcdir}/opt
	mkdir -p ${srcdir}/etc/ld.so.conf.d

	if [ "$CARCH" = "i686" ]; then
	  sed 's/<arch>/ia32/' < ../intel-tbb.conf > ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	  sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	else
	  sed 's/<arch>/intel64/' < ../intel-tbb.conf > ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	  sed -i 's/<INSTALLDIR>/\/opt\/intel\/composerxe/g' ${srcdir}/etc/ld.so.conf.d/intel-tbb.conf
	fi

	cd ${srcdir}
	
	echo -e " # intel-tbb: Extracting RPMS "
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-tbb-${_v_b}-${_tbb_ver}.noarch.rpm
	bsdtar -xf  ${_parallel_studio_xe_dir}/rpm/intel-tbb-devel-${_v_b}-${_tbb_ver}.noarch.rpm

	echo -e " # intel-tbb: Editing variables "
	cd ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin
	rm tbbvars.csh

	sed -i 's/SUBSTITUTE_INSTALL_DIR_HERE/\/opt\/intel\/composerxe\/tbb/g' tbbvars.sh

	chmod a+x tbbvars.sh

	cd ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin
	#rm tbbvars.csh
	sed -i 's/SUBSTITUTE_INSTALL_DIR_HERE/\/opt\/intel\/composerxe\/tbb/g' tbbvars.sh
	chmod a+x tbbvars.sh

	echo -e " # intel-tbb: Remove unneeded libs and bin "
	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/bin/${_not_arch}	
	rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/lib/${_not_arch}
	
	if $_remove_docs ; then
	  echo -e " # intel-tbb: remove documentation "
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/Documentation
	  rm -rf ${srcdir}/opt/intel/${_composer_xe_dir}/tbb/examples
	fi

	echo -e " # intel-tbb: Move package "
	mv ${srcdir}/opt ${pkgdir}
	
	mkdir -p ${pkgdir}/etc
	mv ${srcdir}/etc/ld.so.conf.d ${pkgdir}/etc
}

pkgdesc="Intel C++ C and fortran compiler - Intel Parallel Studio XE  - intel compiler - icc icpc ifort ipp mkl "
depends=('bash' 'gcc')
