# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=opera-rc
_ver=12.15
_rcver=2
_name="noserch"
_build=1745
pkgver="${_ver}rc${_rcver}.${_build}"
pkgrel=1
pkgdesc='A fast and secure web browser and Internet suite - release candidate'
arch=('i686' 'x86_64')
url='http://www.opera.com/browser/'
license=('custom:opera')
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext' 'glib2'
         'shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('gstreamer0.10-base-plugins: HTML5 Video support'
            'gstreamer0.10-good: HTML5 Video support')
provides=('opera')
conflicts=('opera')
install=opera.install
options=(!strip !zipman)

if [[ $CARCH == i686 ]]; then
  _arch=i386
  source=(http://snapshot.opera.com/unix/${_name}_${_ver}-${_build}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  md5sums=('f87bdd3aa845fe4f17a73eaea8208a6a')
elif [[ $CARCH == x86_64 ]]; then
  _arch=$CARCH
  source=(http://snapshot.opera.com/unix/${_name}_${_ver}-${_build}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  md5sums=('e0b4a7ddc75cd9f0e698b56e123d1526')
fi

package() {
  opera-${_ver}-${_build}.${_arch}.linux/install --prefix /usr --repackage $pkgdir/usr
  install -D -m 644 $pkgdir/usr/share/opera/defaults/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
