# Contributor: Apkawa <apkawa@gmail.com>

pkgname=tag2utf
pkgver=0.16
pkgrel=3
pkgdesc="Tool for encoding tags of mp3 files in the cyrillic charsets to unicode."
arch=("any")
url="http://tag2utf.sourceforge.net/"
license=('GPL')
depends=('python-eyed3' 'python2')
source=( "http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.py")
md5sums=('82b21ac25eb972dd78c7b53dd608a3f0')

build() {
    
    install -Dm 755 ${srcdir}/tag2utf-${pkgver}.py ${pkgdir}/usr/bin/tag2utf
    sed -i 's/#\!\/usr\/bin\/python/#!\/usr\/bin\/python2/' ${pkgdir}/usr/bin/tag2utf


}
