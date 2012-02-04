pkgname=packetstorm
pkgver=1.0
pkgrel=3
pkgdesc="Perl script to download and search a local copy of packetstormsecurity.net's yearly and monthly exploit archives"
arch=('any')
license=('GPL')
url="http://www.packetstormsecurity.net/"
depends=('perl' 'perl-libwww' 'perl-ansicolor' 'grep' 'tar')
source=('packetstorm.pl')
md5sums=('8da67e78965287d3f0515448e3e7bacb')
sha1sums=('f21f3a93dc23e7115117391224eba23c13efaaff')

build() {
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/opt/packetstorm

cp ${srcdir}/packetstorm.pl ${pkgdir}/usr/bin/packetstorm

chmod -R 755 ${pkgdir}/
}
