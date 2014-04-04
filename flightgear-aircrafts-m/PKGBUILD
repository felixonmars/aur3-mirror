#Maintainer: Nicola Bignami <nicola@kernel-panic.no-ip.net>

pkgname=flightgear-aircrafts-m
pkgver=3.0
pkgrel=1
pkgdesc="Aircraft collection for Flightgear - Name beginning with letter M."
url="http://www.flightgear.org/"
license=('GPL')
depends=('flightgear' 'flightgear-data')
makedepends=('wget' 'unzip')
arch=('i686' 'x86_64')
options=('!emptydirs' '!ccache')

package() {
  cd "${srcdir}"
  _FTP_HOST='mirrors.ibiblio.org'				#flightgear mirror
  _FTP_DIR='flightgear/ftp/Aircraft-'$pkgver
  
  wget --retry-connrefused 'ftp://'$_FTP_HOST'/'$_FTP_DIR'/m*'	#get and unzip the aircrafts
  wget --retry-connrefused 'ftp://'$_FTP_HOST'/'$_FTP_DIR'/M*'	#get and unzip the aircrafts
  for _filename in *.zip
  do
    unzip $_filename
  done
  
  rm -f *.zip							#clean up the zip files
  
  #for _dirname in /usr/share/flightgear/data/Aircraft/*		#remove already installed aircrafts
  #do
  #  _dirname=${_dirname#*Aircraft/}
  #  if [ -d "$_dirname" ]; then
  #    rm -Rf $_dirname
  #  fi
  #done
  
  mkdir -p $pkgdir/usr/share/flightgear/data/Aircraft		#move the aircraft data to the package
  mv * $pkgdir/usr/share/flightgear/data/Aircraft/
}
