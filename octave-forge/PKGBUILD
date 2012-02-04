# Contributor: Tom < reztho at archlinux dot us >
# 
# Thanks to sq5nbg for hix fix to this package
# Thanks to net147 for his fixes to this package

pkgname=octave-forge
pkgver=20090607
pkgrel=5
pkgdesc="Extra packages for GNU Octave."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/"
license=('GPL')
depends=('octave>=3.2.0' 'octave<3.3' 'gsl' 'netcdf' 'ginac' 'binutils' 'lapack' 'pcre' 'fftw' 'freetype2' 'perl' 'libjpeg' 'libpng' 'ffmpeg')
makedepends=('gcc-fortran')
provides=('octave-forge')
options=('!makeflags')
install=octave-forge.install
source=("http://downloads.sourceforge.net/octave/${pkgname}-bundle-${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-bundle-${pkgver}

  # Unsetting TERM for fixing the problem with some terminals
  unset TERM

  # Adding a flag to CXXFLAGS
  export CXXFLAGS="${CXXFLAGS} -D__STDC_CONSTANT_MACROS"

  # Internal variable for setting the .m support file for installation of the packages
  _m_file=${srcdir}/pkgbuild_install_pkgs.m
  # Internal variable for the categories of packages. By now I won't consider the nonfree packages
  _pkg_categories=('main' 'extra' 'language')
  # List of packages impossible to install because of problems when compiling.
  _dont_install="main/ann-1.0.2.tar.gz main/image-1.0.10.tar.gz main/database-1.0.4.tar.gz \
  main/fixed-0.7.10.tar.gz main/ftp-1.0.2.tar.gz main/parallel-2.0.0.tar.gz main/specfun-1.0.8.tar.gz \
  main/vrml-1.0.10.tar.gz extra/graceplot-1.0.8.tar.gz extra/java-1.2.6.tar.gz \
  extra/jhandles-0.3.5.tar.gz extra/windows-1.0.8.tar.gz extra/xraylib-1.0.8.tar.gz \
  language/spanish-1.0.1.tar.gz"

  # Deleting the packages from the list
  for _i in ${_dont_install}
  do
	  rm ${srcdir}/${pkgname}-bundle-${pkgver}/${_i} || return 1
  done

  # We need to know the current global directory prefix previously
  _varx=0
  for _i in `/usr/bin/octave -H --silent --eval 'pkg -global prefix' | tr -d ' ' | cut -d ':' -f 2`
  do
	_directories[${_varx}]=${_i}
    _varx=$(expr ${_varx} + 1)
  done

  # We make the destination directories
  mkdir -p ${pkgdir}/${_directories[0]}
  mkdir -p ${pkgdir}/${_directories[1]}

  # Now we make our .m file for using it in octave
  echo "pkg prefix ${pkgdir}${_directories[0]} ${pkgdir}${_directories[1]}" > ${_m_file}
  
  # - Preventing octave from writing to ~/.octave_packages
  echo 'pkg local_list /dev/null' >> ${_m_file}

  _vartotal=${#_pkg_categories[@]}
  _varx=0
  while [ ${_varx} -lt ${_vartotal} ]
            do
  		echo "pkgs = dir(\"${srcdir}/${pkgname}-bundle-${pkgver}/${_pkg_categories[${_varx}]}/\");" >> ${_m_file}
  		echo "cd ${srcdir}/${pkgname}-bundle-${pkgver}/${_pkg_categories[${_varx}]}" >> ${_m_file}
		echo "  for i = 3:length(pkgs)" >> ${_m_file}
		echo "  pkgs(i).name" >> ${_m_file}
		echo "  pkg(\"install\",\"-nodeps\",\"-local\",pkgs(i).name)" >> ${_m_file}
		echo "  endfor" >> ${_m_file}
        _varx=$(expr ${_varx} + 1)
  done

  # Now we tell octave to "install" the packages using our .m file
  cd `dirname ${_m_file}`
  /usr/bin/octave -H --silent --eval `basename ${_m_file} .m` || return 1
}

md5sums=('faf95ff58884cd29379015b70f57c745')
