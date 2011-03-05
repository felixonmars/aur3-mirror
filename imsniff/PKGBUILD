# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=imsniff
pkgver=0.04
pkgrel=1
pkgdesc="pcap-based instant messaging sniffer. It captures the IM traffic in the network and is able to log conversations, contact lists, profile information, incoming email notifications, other MSN events, etc."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/im-snif/"
license=('GPLv2')
depends=('libpcap')
source=("http://downloads.sourceforge.net/sourceforge/im-snif/${pkgname}_${pkgver}.tgz")
md5sums=('689c456f8edb77b9b4199a25514ac683')
sha1sums=('c7b20fdf9c79869e222d4ee6771f1f9b72525f83')

build() {
  # compilation
  install -d ${pkgdir}/usr/share/${pkgname} || return 1
  install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  install -Dm644 ${srcdir}/docs/README ${pkgdir}/usr/share/${pkgname}/README || return 1
  install -Dm644 ${srcdir}/docs/TODO ${pkgdir}/usr/share/${pkgname}/TODO || return 1
  install -Dm644 ${srcdir}/docs/ChangeLog ${pkgdir}/usr/share/${pkgname}/ChangeLog || return 1
  install -Dm644 ${srcdir}/docs/imsniff.conf.sample ${pkgdir}/usr/share/${pkgname}/imsniff.conf.sample || return 1
  install -Dm644 ${srcdir}/docs/AUTHORS ${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS || return 1
  install -Dm644 ${srcdir}/docs/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
  cd ${srcdir}/linux
  ./build || return 1
  install -Dm750 ${srcdir}/linux/imsniff ${pkgdir}/usr/share/${pkgname}/imsniff || return 1

  # create startup app
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/imsniff
  echo "cd /usr/share/imsniff" >> ${pkgdir}/usr/bin/imsniff
  echo "./imsniff \"\$@\"" >> ${pkgdir}/usr/bin/imsniff
  echo "cd -" >> ${pkgdir}/usr/bin/imsniff
  chmod +x ${pkgdir}/usr/bin/imsniff

  # user notification
  echo -e ""
  echo -e "\e[1;34m>>>\e[0m \e[1;31mrun imsniff from '\e[1;34m/usr/bin/imsniff\e[0m\e[1;31m'\e[0m"
  echo -e "\e[1;34m>>>\e[0m \e[1;31mYou can configure imsniff via command line parameters, or via a file called '\e[1;34mimsniff.conf\e[0m\e[1;31m' that should be placed in the '\e[0m\e[1;34m/usr/share/imsniff\e[0m\e[1;31m' directory. '\e[1;34m/usr/share/imsniff/imsniff.conf.sample\e[0m\e[1;31m' is available as an example\e[0m"
}
