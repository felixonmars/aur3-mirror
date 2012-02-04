# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-yandexnarod-svn
pkgver=20
pkgrel=1
pkgdesc="Yandex.Narod file tranfer support for Qutim. SVN version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=('subversion' 'gcc' 'make')
provides=('qutim-plugin-yandexnarod')
conflicts=('qutim-plugin-yandexnarod')
replaces=('qutim-plugin-yandexnarod')

_svnmod=qutim-yandexnarod
_svntrunk=https://boiler.co.ru/svn/$_svnmod

build() {
msg "Downloading from $_svntrunk ..."
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $srcdir/$_svnmod-build

msg "Building and installing..."  
  qmake || return 1
  make || return 1
  install -Dm 644 libyandexnarod.so \
                  $pkgdir/usr/lib/qutim/libyandexnarod.so || return 1   

msg "Removing temporary files..."
  rm -rf $_svnmod-build
}
