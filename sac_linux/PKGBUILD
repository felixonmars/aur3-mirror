pkgname=sac_linux
pkgver=8.3.34
pkgrel=1
pkgdesc="http://www.aladdin-rd.ru/ pkiclient"
arch=('i686' 'x86_64')
url="http://www.aladdin-rd.ru/"
progname="SafenetAuthenticationClient"
startdir=`pwd`
depends=(hal libpng12 gtk2 libsm pcsclite)
makedepends=(unzip rpmextract)
license=('custom')
source=('SAC_8_3_Linux_GA.iso'
		'SACSrv.service')
md5sums=('EB03AFC7D2DB9F458B1BB5B7122E041F'
		 '17db61238547e95452bd67ce0fae5591')
package() {


  cd ${srcdir}/Installation/Standard/RPM
  if test "$CARCH" == 'x86_64'; then
		safename=${progname}-${pkgver}-0.x86_64.rpm
  else
		safename=${progname}-${pkgver}-0.i386.rpm
  fi
 
  echo "mainfile: ${srcdir}/Installation/Standard/RPM/${safename}"
  
  cd ${pkgdir}
  rpmextract.sh "${srcdir}/Installation/Standard/RPM/${safename}" 
  
  if test "$CARCH" == 'x86_64'; then
	rm -rf usr/lib64
	mkdir -p ${pkgdir}/usr/lib
	mv lib64/* usr/lib/
	rm -rf lib64
    mkdir -p ${pkgdir}/usr/lib/systemd/system
    install -Dm644 "${startdir}/SACSrv.service" ${pkgdir}/usr/lib/systemd/system/
  else
    rm -rf usr/lib/*
	mv lib/* usr/lib/
	rm -rf lib
    mkdir -p ${pkgdir}/usr/lib/systemd/system
    install -Dm644 "${startdir}/SACSrv.service" ${pkgdir}/usr/lib/systemd/system/
  fi
  #cleaning up
  rm -rf etc/rc.d
  rm -rf etc/init.d
  #make driver links
  mkdir -p ${pkgdir}/usr/lib/pcsc/drivers
  cd ${pkgdir}/usr/lib/pcsc/drivers
  ln -s /usr/share/eToken/drivers/aks-ifdh.bundle .
}
