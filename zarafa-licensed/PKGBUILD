# Contributor: C Anthony Risinger

pkgname=zarafa-licensed
pkgver=7.1.7
pkgrel=42779
pkgdesc="Open Source Groupware Solution"
arch=('x86_64')
url="http://www.zarafa.com/"
license=('AGPL3')
depends=('zarafa-server')
source=("zarafa-licensed"
	"http://download.zarafa.com/community/final/7.1/${pkgver}-${pkgrel}/zcp-${pkgver}-${pkgrel}-ubuntu-12.04-x86_64-free.tar.gz"
	"http://www.miketaylor.org.uk/tech/deb/deb2targz"
	"zarafa-licensed.service"
	"http://www.gtlib.gatech.edu/pub/ubuntu//pool/universe/b/boost1.46/libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.deb"
	"http://www.gtlib.gatech.edu/pub/ubuntu//pool/universe/b/boost1.46/libboost-system1.46.1_1.46.1-7ubuntu3_amd64.deb"
	"http://www.gtlib.gatech.edu/pub/ubuntu//pool/main/i/icu/libicu48_4.8.1.1-3_amd64.deb")
noextract=()
md5sums=('859d9c83e6aee7b4e3e01104ef9190d7'
         '5ac8c0b15364166df7e3f22172e4aed5'
         '5b944785778d023a43e33af53bea2056'
         '2a2a9da1b1cfd1126357c54de9478bf6'
         'ff336586b35a35db899ab9523d3a4f4a'
         '35395ebb1b4f5e33087f0bf9420cfca7'
         'eb45b2fdfd9919189e327c5981fc7f71')

package() {
  cd ${srcdir}/zcp-${pkgver}-${pkgrel}-ubuntu-12.04-x86_64
  chmod +x ${srcdir}/deb2targz
  ${srcdir}/deb2targz zarafa-licensed_${pkgver}-${pkgrel}_amd64.deb
  tar xfz zarafa-licensed_${pkgver}-${pkgrel}_amd64.tar.gz
#  sed -i 's/libicu//' usr/bin/zarafa-licensed
  mv etc/ usr/ ${pkgdir}
  rm -r ${pkgdir}/usr/share/man
  rm -r ${pkgdir}/etc/init.d
  mkdir ${pkgdir}/etc/rc.d
  install -m 755 ${srcdir}/zarafa-licensed ${pkgdir}/etc/rc.d
#  rm -r ${pkgdir}/usr/share/man
  mkdir -p  ${pkgdir}/etc/systemd/system
  install -m 644 ${srcdir}/zarafa-licensed.service ${pkgdir}/etc/systemd/system

  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/ubuntu1204libs
  ./deb2targz libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.deb
  tar xfz libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.tar.gz
  install -m 644 ${srcdir}/usr/lib/libboost_filesystem.so.1.46.1 ${pkgdir}/opt/ubuntu1204libs
  ./deb2targz libboost-system1.46.1_1.46.1-7ubuntu3_amd64.deb
  tar xfz libboost-system1.46.1_1.46.1-7ubuntu3_amd64.tar.gz
  install -m 644 ${srcdir}/usr/lib/libboost_system.so.1.46.1 ${pkgdir}/opt/ubuntu1204libs
  ./deb2targz libicu48_4.8.1.1-3_amd64.deb
  tar xfz libicu48_4.8.1.1-3_amd64.tar.gz
  install -m 644 ${srcdir}/usr/lib/libicuuc.so.48 ${pkgdir}/opt/ubuntu1204libs
  install -m 644 ${srcdir}/usr/lib/libicudata.so.48 ${pkgdir}/opt/ubuntu1204libs
}
