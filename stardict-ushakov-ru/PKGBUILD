# Maintainer: baobab<>heresiarch.info

pkgname=stardict-ushakov-ru
pkgver=2.4.2
pkgrel=1
pkgdesc="Ushakov russian explanatory dictionary in stardict format"
arch=('any')
url="http://sourceforge.net/projects/xdxf/"
license=('GPL')
optdepends=('stardict' 'goldendict')
source=(http://downloads.sourceforge.net/project/xdxf/dicts-stardict-form-xdxf/002a/stardict-comn_dictd04_ushakov-2.4.2.tar.bz2)
md5sums=('b2b0ccce49fa0ef07f59e2b2f9ddb33a')

build() {
  cd "$srcdir/${pkgname/-ru}-$pkgver"
  mkdir -p $pkgdir/usr/share/stardict/dic/
  install -m 644 * $pkgdir/usr/share/stardict/dic/
}
