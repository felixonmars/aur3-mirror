# Maintainer: perlawk

pkgname=root-bin
pkgver=6.03
pkgrel=1
pkgdesc='C++ data analysis framework and interpreter from CERN. Binary version'
arch=('x86_64' 'i686')
url='http://root.cern.ch'
license=('LGPL2.1')
#options=('nostrips' 'staticlibs')
depends=('desktop-file-utils'
	 'fftw'
	 'ftgl'
	 'giflib'
	 'glew'
	 'graphviz'
	 'gsl'
	 'libmysqlclient'
	 'postgresql-libs'
	 'python2'
	 'unixodbc'
	 'shared-mime-info'
	 'xmlrpc-c'
	 'xorg-fonts-75dpi'
	 'gcc-fortran'
	 'libiodbc'
	 'gtk-update-icon-cache'
	 'libafterimage')
options=('!emptydirs')

if [ $CARCH == 'i686' ]; then
  source=("ftp://root.cern.ch/root/root_v6.03.02.Linux-slc6-gcc4.8.tar.gz" "roots.sh")
  md5sums=(SKIP)
else
  source=( "ftp://root.cern.ch/root/root_v6.03.02.Linux-slc6_amd64-gcc4.8.tar.gz" "roots.sh")
  md5sums=(SKIP)
fi

package() {
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir"
  cp -a root "$pkgdir/usr/lib"
  cp roots.sh "$pkgdir/usr/bin"
}
md5sums=('6e36a3d5518cfde5807494c4a185ee59'
         'd397a7d1108b6596c9bba8677756b3d6')
