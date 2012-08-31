# Maintainer: kevku <kevku@gmx.com>
pkgname=sk-esteidfirefoxplugin-svn
_pkgname=esteid-plugin
pkgver=62
pkgrel=1
pkgdesc="Estonian ID-card Firefox plugin (Official version by AS Sertifitseerimiskeskus)"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('sk-esteidpkcs11loader-svn' 'gtk2')
optdepends=('java-pkcs11wrapper: Java based signing.')
makedepends=('cmake' 'subversion')
conflicts=('esteid-browser-plugin-svn')

_svntrunk=https://svn.eesti.ee/projektid/idkaart_public/trunk/$_pkgname
_svnmod=$_pkgname

build() {
  cd "$srcdir"
  #rm -rf "$srcdir/$_svnmod"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  sed -i "s|1.20|3.6.0.$pkgver|g" common/version.h
  make plugin
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -D npesteid-firefox-plugin.so $pkgdir/usr/lib/mozilla/plugins/npesteid-firefox-plugin.so
}

