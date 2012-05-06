# Maintainer: mehine2 <mehine2@hotmail.com>
pkgname=mehine2-qesteidutil-svn
_pkgname=qesteidutil
pkgver=50
pkgrel=1
pkgdesc="Estonian ID-card utility (Minu parandatud versioon KASUTA OMAL RISKIL)"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('qt')
makedepends=('cmake' 'subversion' 'sk-smartcardpp-svn')
conflicts=('qesteidutil-svn')
install=qesteidutil.install


_svntrunk=https://svn.eesti.ee/projektid/idkaart_public/trunk/$_pkgname
_svnmod=$_pkgname


build() {
  cd "$srcdir"
  rm -rf "$srcdir/$_svnmod"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

echo "asendan vigase qtlocalpeer.cpp"
cd qesteidutil/qtsingleapplication/src/
rm qtlocalpeer.cpp
wget http://web.zone.ee/mehine2/aur/trunk/qtlocalpeer.cpp
cd ..
cd ..
cd ..
echo "ja jätkub originaal install"



  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  #fix lame ubantu crap.
  sed -i 's|SET(LIB_SUFFIX 64)|SET(LIB_SUFFIX "")|g' cmake/modules/InstallSettings.cmake

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIB_SUFFIX="" -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

