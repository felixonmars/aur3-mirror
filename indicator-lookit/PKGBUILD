# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=indicator-lookit
_name=lookit
pkgver=0.3.1
pkgrel=1
pkgdesc="Quick screenshot uploader"
arch=('i686' 'x86_64')
url="https://launchpad.net/lookit"
license=('GPL')
groups=('ayatana')
depends=('libindicator>=0.3.0' 'libdbusmenu>=0.1.1' 'ido>=0.1.10' 'dconf>=0.5.1' 'python-paramiko' 'python-notify' 'python-keybinder' 'python-pycurl' 'xdg-user-dirs')
makedepends=('intltool' 'python2')
options=(!libtool)
install=$pkgname.install
source=(http://cloud.github.com/downloads/zachtib/${_name}/${_name}-$pkgver.tar.gz)
md5sums=('1b5a91040461d940d04dcc4a83ed2578')


build() {
  cd "$srcdir/${_name}-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  
  python2 setup.py install --prefix=${pkgdir}/usr
  
  # Default to monochrome icon
  mv $pkgdir/usr/share/pixmaps/lookit.svg $pkgdir/usr/share/pixmaps/lookit-original.svg
  cp $pkgdir/usr/share/pixmaps/lookit-dark.svg $pkgdir/usr/share/pixmaps/lookit.svg
}
