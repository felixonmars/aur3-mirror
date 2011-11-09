# Maintainer: jsteel <jsteel at vorx dot com>
# Contributor: Chris Schwaab christopher.schwaab gmail
# Contributor: Roger Braun
# Contributor: twa022 <twa022@gmail.com>
# Contributor: jwbwater <jwbwater@gmail.com>

pkgname=amazonmp3
pkgver=1.0.9
pkgrel=1
pkgdesc="The Amazon MP3 downloader"
url="http://www.amazon.com/gp/dmusic/help/amd.html"
arch=('i686')
license=('custom')
depends=('bash' 'libxdamage' 'curl' 'pango' 'gtk2' 'openssl' 'gtkmm' 'pangomm' 'cairomm' 'glibmm' 'libsigc++' 'bzip2')
makedepends=('deb2targz')
source=('http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-signals1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-thread1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-filesystem1.34.1_1.34.1-16ubuntu1_i386.deb' \
        'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-regex1.34.1_1.34.1-16ubuntu1_i386.deb' \
	http://amazonm-002.vo.llnwd.net/u/d1/clients/en_US/${pkgver}/${pkgname}_${pkgver}~ibex_i386.deb)
md5sums=('8a92592ff53bfd88e4ef30702bc3a5c0'
         'ab12bd95053d2dfaf5384b8fec0ef928'
         '1c1e73957bb3df7991b8ba625e42dc3e'
         '718b975d711d3e3d7d7288a1ca73fae4'
         '7874268959797728f59e95a5bf6751ea'
         'cae0c9df29cd84d85dc9cb51f371427c'
         'e246ab57f9e8bce827ab39341b241fd4')

build() {
  cd "${srcdir}"

  for i in *.deb; do
    deb2targz "$i"
  done
}

package() {
  cd "${pkgdir}"

  for i in "${srcdir}"/*.tar.gz; do
    tar -zxf "$i"
  done

  ln -s /usr/lib/libicui18n.so "${pkgdir}/usr/lib/libicui18n.so.40"
  ln -s /usr/lib/libicuuc.so "${pkgdir}/usr/lib/libicuuc.so.40"
  ln -s /usr/lib/libcrypto.so "${pkgdir}/usr/lib/libcrypto.so.0.9.8"
  ln -s /usr/lib/libssl.so "${pkgdir}/usr/lib/libssl.so.0.9.8"

  rm "${pkgdir}"/{control,md5sums,postinst,postrm}
}
