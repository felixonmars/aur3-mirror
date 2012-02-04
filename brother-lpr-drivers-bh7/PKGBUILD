# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-lpr-drivers-bh7
pkgver=1.0.1
pkgrel=1
pkgdesc="This package provides all LPR drivers for models DCP-130C DCP-330C DCP-540CN DCP-750CW FAX-1860C FAX-1960C FAX-2480C FAX-2580C MFC-240C MFC-3360C MFC-440CN MFC-5460CN MFC-5860CN MFC-660CN MFC-665CW MFC-845CW"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  '589d5bcbd530e15fd3f7218a6eb342c8') && depends=('brother-lpr-drivers-common' 'a2ps' 'lib32-glibc')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  'eed000c2b09185f7658594321fcefaaf') && depends=('brother-lpr-drivers-common' 'a2ps')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-1-0ubuntu3_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-1-0ubuntu3_${_a}.deb || return 1
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
