# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-lpr-drivers-extra
pkgver=1.2.0
pkgrel=1
pkgdesc="This package provides all LPR drivers for models FAX-1815C FAX-1820C FAX-1835C FAX-1840C FAX-1920CN FAX-1940CN FAX-2440C MFC-210C MFC-3220C MFC-3240C MFC-3320CN MFC-3340CN MFC-3420C MFC-3820CN MFC-410CN MFC-420CN MFC-5440CN MFC-5840CN MFC-620CN DCP-110C DCP-310CN DCP-560CN DCP-770CW DCP-350C DCP-353C MFC-465CN MFC-680CN MFC-685CW MFC-885CW MFC-230C MFC-235C MFC-260C DCP-135C DCP-150C DCP-153C"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  'ab88dc4f77e12d75b20c8f1de4edaa61') && depends=('brother-lpr-drivers-common' 'a2ps' 'lib32-glibc' 'lib32-gcc-libs')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '10423d873874089868e8c4c2f54594ff') && depends=('brother-lpr-drivers-common' 'a2ps')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-2-0ubuntu3_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-2-0ubuntu3_${_a}.deb || return 1
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
