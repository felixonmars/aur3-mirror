# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=itun
pkgver=04_10_2005
pkgrel=1
pkgdesc="Simple icmp tunnel provide encapsulation of IP packets into ICMP packets. It can be used to pass through firewalls which not block icmp packets."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/itun/"
license=('GPLv2')
source=("http://downloads.sourceforge.net/sourceforge/itun/itun-04-10-2005.tar.gz")
md5sums=('47cbb410fa76bc9337264d2e6b3213b1')
sha1sums=('1883d9b03521992b9162c9dadc1d4068537eba40')

build() {
  cd ${srcdir}/itun-04-10-2005
  ###############################################################
  ## THE FOLLOWING ALLOWS YOU TO SET A CUSTOM BUILD, VIA PKGBUILD
  ## uncomment any line that starts with 'sed -i' for custom config during build process
  ## 
  ##IP address of remote peer
  #sed -i 's|195.24.141.97|YOUR_IP|g' ./config.h || return 1
  #
  ##Name of local tunnel interface
  #sed -i 's|tun0|YOUR_INTERFACE|g' ./config.h || return 1
  #
  ##Local IP address for tunnel
  #
  #sed -i 's|10.95.1.2|YOUR_IP|g' ./config.h || return 1
  #
  ##Remote IP address for tunnel
  #sed -i 's|10.95.1.1|YOUR_IP|g' ./config.h || return 1
  #######################################################
  ## FOR THE Connection scheme section, uncomment all 6 'sed -i' lines, keeping one UNcommented
  ##
  ##Connection scheme 1 (ICMP client)
  #sed -i 's|#define SEND_PKT ICMP_ECHO|//#define SEND_PKT ICMP_ECHO|g' ./config.h || return 1
  #sed -i 's|#define RECV_PKT ICMP_ECHOREPLY|//#define RECV_PKT ICMP_ECHOREPLY|g' ./config.h || return 1
  #
  ##Connection scheme 2 (ICMP server)
  #sed -i 's|//#define SEND_PKT ICMP_ECHOREPLY|#define SEND_PKT ICMP_ECHOREPLY|g' ./config.h || return 1
  #sed -i 's|//#define RECV_PKT ICMP_ECHO|#define RECV_PKT ICMP_ECHO|g' ./config.h || return 1
  #
  ##Connection scheme 3
  #sed -i 's|//#define SEND_PKT ICMP_ECHOREPLY|#define SEND_PKT ICMP_ECHOREPLY|g' ./config.h || return 1
  #sed -i 's|//#define RECV_PKT ICMP_ECHOREPLY|#define RECV_PKT ICMP_ECHOREPLY|g' ./config.h || return 1
  #
  ##peer ID, must be equal on both peers
  #sed -i 's|65534|YOUR_PEER|g' ./config.h || return 1
  ##############################################################
  install -d ${pkgdir}/usr/src/${pkgname} || return 1
  install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -Dm644 README ${pkgdir}/usr/src/${pkgname}/README || return 1
  install -Dm644 FAQ ${pkgdir}/usr/src/${pkgname}/CHANGELOG || return 1
  install -Dm644 COPYING  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
  make || return 1
  install -Dm750 itun ${pkgdir}/usr/src/${pkgname}/itun || return 1
  install -Dm750 route.sh ${pkgdir}/usr/src/${pkgname}/route.sh || return 1
  ln -sf /usr/src/${pkgname}/itun ${pkgdir}/usr/bin/itun || return 1
  cp -p Makefile Makefile.dep config.h *.c *.o ${pkgdir}/usr/src/${pkgname}/ || return
  echo -e ""
  echo -e "\e[1;34m>>>\e[0m \e[1;31mitun was compiled with defaults specified in the '\e[1;34mconfig.h\e[0m\e[1;31m' file\e[0m"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mfor any custom config changes (IP, ICMP schemes, etc) edit '\e[1;34m/usr/src/itun/config.h\e[0m\e[1;31m' and run '\e[0m\e[1;34mmake\e[0m\e[1;31m' in the '\e[1;34m/usr/src/itun\e[0m\e[1;31m' directory, or reinstall this package making custom changes in the AUR '\e[1;34mPKGBUILD\e[0m\e[1;31m' file\e[0m"
}
