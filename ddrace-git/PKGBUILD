

pkgname=ddrace-git
url="http://ddrace.info"
pkgver=0.5
_dirname=ddrace
pkgrel=2
pkgdesc="DDRace server and deamon for Teeworlds. Current Github."
arch=('i686' 'x86_64')
license=('custom')
makedepends=('python')
depends=('git' 'bam')
source=('http://fluxid.pl/teeworlds/maps/campotle.map' 
	'ddraced'
	'ddrace.conf'
	'campotle.map')
md5sums=('1ed8b71e5285a58b58f0ef2971979d34'
	'a32485c2dbb4e3246bd7af135e80ad26'
	'24c3614d48c04e5283c56f9e533a731f'
	'1ed8b71e5285a58b58f0ef2971979d34')
#install=${pkgname}.install

build() {

  #get the source
  if [ -d DDRace ]; then
    cd DDRace
    git pull
  else 
    git clone git://github.com/GreYFoXGTi/DDRace.git
  fi

  #Build DDrace
  cd ${srcdir}/DDRace
    
  bam server_release  || return 1

  # Install the server 
  install -Dm755 ${srcdir}/DDRace/DDRace_Trunk-Server \
    ${pkgdir}/usr/bin/${_dirname}_srv || return 1

  
  install -Dm755 ${srcdir}/campotle.map \
    ${pkgdir}/etc/maps/campotle.map || return 1

  install -Dm755 ${srcdir}/ddrace.conf \
    ${pkgdir}/etc/ddrace.conf || return 1
 
  mkdir -p ${pkgdir}/etc/rc.d
  install -Dm755 ${srcdir}/ddraced \
    ${pkgdir}/etc/rc.d/ddraced || return 1

}
