# Maintainer: Christoph Vigano <mail@cvigano.de>

pkgname=javacv
pkgver=0.10
pkgrel=1
pkgdesc="Java bindings for OpenCV - binary build"
arch=('any')
url="https://github.com/bytedeco/javacv/"
license=('GPL2')
makedepends=('unzip')
depends=('java-environment' 'opencv>=2.4') 
optdepends=(
  'ffmpeg: additional functionality'
  'libdc1394: additional functionality'
  'android-sdk: API for programming Android apps'
  )

source=(${pkgname}-${pkgver}.zip::http://search.maven.org/remotecontent?filepath=org/bytedeco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-bin.zip)

package() {
  cd ${srcdir}/${pkgname}-bin

  mkdir -p ${pkgdir}/usr/share/java/${pkgname}

  install -Dm755 *.jar ${pkgdir}/usr/share/java/${pkgname}/
}
md5sums=('efe6153d37b9e46419bcff254e5c75aa')
