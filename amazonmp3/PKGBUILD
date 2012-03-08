# Maintainer: jsteel <jsteel at vorx dot com>
# Contributor: Chris Schwaab christopher.schwaab gmail
# Contributor: Roger Braun
# Contributor: twa022 <twa022@gmail.com>
# Contributor: jwbwater <jwbwater@gmail.com>

pkgname=amazonmp3
pkgver=1.0.9
pkgrel=7
pkgdesc="The Amazon MP3 downloader"
url="http://www.amazon.com/gp/dmusic/help/amd.html"
arch=('i686')
license=('custom')
depends=('bash' 'libxdamage' 'curl<=7.23.1' 'pango' 'gtk2' 'openssl' 'gtkmm' 'pangomm' 'cairomm' 'glibmm' 'libglademm' 'libsigc++' 'bzip2')
source=('http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-date-time1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-iostreams1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-signals1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-thread1.34.1_1.34.1-4ubuntu3_i386.deb' \
	'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-filesystem1.34.1_1.34.1-4ubuntu3_i386.deb' \
        'http://mirrors.kernel.org/ubuntu/pool/universe/b/boost/libboost-regex1.34.1_1.34.1-4ubuntu3_i386.deb' \
	http://amazonm-002.vo.llnwd.net/u/d1/clients/en_US/${pkgver}/${pkgname}_${pkgver}~ibex_i386.deb)
md5sums=('8a92592ff53bfd88e4ef30702bc3a5c0'
         'ab12bd95053d2dfaf5384b8fec0ef928'
         '1c1e73957bb3df7991b8ba625e42dc3e'
         '718b975d711d3e3d7d7288a1ca73fae4'
         'c60ae2ad58a8698806ea473e618d2332'
         '23340c2755feece89e4757f076f4efe7'
         'e246ab57f9e8bce827ab39341b241fd4')

build() {
  cd "${srcdir}"

  for i in *.deb; do
    ar xv "$i" control.tar.gz data.tar.gz
    mv control.tar.gz "$i-control.tar.gz"
    mv data.tar.gz "$i-data.tar.gz"
  done
}

package() {
  cd "${pkgdir}"

  for i in "${srcdir}"/*.tar.gz; do
    tar -zxf "$i"
  done

  sed -i 's/0.9.8/1.0.0/' "$pkgdir/usr/bin/amazonmp3"

  ln -s /usr/lib/libicui18n.so "${pkgdir}/usr/lib/libicui18n.so.38"
  ln -s /usr/lib/libicuuc.so "${pkgdir}/usr/lib/libicuuc.so.38"

  rm "${pkgdir}"/{control,md5sums,postinst,postrm,shlibs}
}
