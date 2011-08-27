# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-cups-wrapper-bh7
pkgver=1.0.0
pkgrel=1
pkgdesc="This package provides all cups wrapper drivers for models DCP-130C DCP-330C DCP-540CN DCP-750CW FAX-1860C FAX-1960C FAX-2480C FAX-2580C MFC-240C MFC-3360C MFC-440CN MFC-5460CN MFC-5860CN MFC-660CN MFC-665CW MFC-845CW"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
replaces=(brother-bh7)
depends=('brother-lpr-drivers-bh7' 'brother-cups-wrapper-common')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  '975773e31a0f657cd7bf03d411b6191f')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  '467c41d3c848cd19e5302cc8cf677146')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-10-0ubuntu5_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-10-0ubuntu5_${_a}.deb || return 1
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}
