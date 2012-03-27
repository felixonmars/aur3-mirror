# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Prashant Vaibhav <mercurysquad@googlemail.com>

pkgname=juce
pkgver=1.53
pkgrel=2
pkgdesc="Jules Utility Class Extensions is a Cross Platform C++ Toolkit"
arch=('i686' 'x86_64')
url="http://www.rawmaterialsoftware.com/juce/"
license=('GPL' 'custom')
depends=('mesa' 'libxinerama' 'freetype2' 'pth' 'alsa-lib')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver/./_}.zip")
md5sums=('bbd57c8c788a5e427f723ee810510e23')

build() {
  cd "$srcdir/$pkgname/Builds/Linux"

  # DSO link fix
  export LDFLAGS+=" -ldl -lXext"

  # library
  make CONFIG=Release

  # demo
  cd ../../extras/JuceDemo/Builds/Linux
  make CONFIG=Release
}

package() {
  cd "$srcdir/$pkgname"

  # static lib
  install -Dm644 bin/libjuce.a \
    "$pkgdir/usr/lib/libjuce.a"

  # headers
  install -d "$pkgdir/usr/include/$pkgname"
  install -Dm644 *.{h,cpp} \
    "$pkgdir/usr/include/$pkgname"

  # demo
  install -d "$pkgdir/usr/bin"
  install -Dm755 extras/JuceDemo/Builds/Linux/build/JuceDemo \
    "$pkgdir/usr/bin"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname"

  # custom license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  echo "Visit the page: http://www.rawmaterialsoftware.com/jucelicense.php" \
    > "$pkgdir/usr/share/licenses/$pkgname/COMMERCIAL"
}
