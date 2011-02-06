# Maintainer: renart <lerenart at gmail dot com>

pkgname=facebookplugin
pkgver=1.0.1
pkgrel=1
pkgdesc='Facebook photo upload plugin.'
url='http://www.facebook.com'
arch=('i686')
depends=('libjpeg6' 'libpng12' 'libtiff4')
license=('custom')
source=(http://www.facebook.com/fbplugin/linux-x86/install/FacebookPlugIn-${pkgver}.tar.gz)
md5sums=('e0134daf9dffef6c85ceb3209d812823')

build() {
  cd ${srcdir}/FacebookPlugIn-${pkgver}

  install -d -m755 ${pkgdir}/usr/lib/mozilla/plugins/ || return 1
  install -m755 libnpfbook_1_0_1.so ${pkgdir}/usr/lib/mozilla/plugins/ || return 1
  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}