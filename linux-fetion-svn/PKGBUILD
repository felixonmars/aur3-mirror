#Contributor: thethirdghost<gmail.com>
#Contributor: lh<jarryson@gmail.com>
#Maintainer: Yang Hamo Bai <hamo.by@gmail.com>

pkgname=linux-fetion-svn
pkgver=486
pkgrel=1
pkgdesc="Linux Fetion a KDE IM client, Using CHINA MOBILE's Fetion Protocol "
arch=('i686' 'x86_64')
url="http://www.libfetion.org/" 
license=('GPL')
depends=("qt" "curl" "gcc-libs" "libstdc++5")
makedepends=('gcc' 'subversion')
source=()
md5sums=()

_svnmod="linux-fetion"
_svntrunk="http://libfetion-gui.googlecode.com/svn/trunk/qt4_src"

build() { 
  cd $srcdir/
  msg "Getting source..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ./ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Creating make environment..."

  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  msg "Starting make..."
  rm -rf `find $startdir/src/$_svnmod-build -type d -name .svn`

  if [[ "${CARCH}" == "x86_64" ]]; then
    ./64_libfetion.sh
  fi

  qmake || return 1 

  # change link order to fix build error,just a work-around
  sed -i -e "/^LIBS/s/ -lcurl//" Makefile
  sed -i -e "/^LIBS/s/$/ -lcurl/" Makefile

  make ||return 1

  mkdir -p ${pkgdir}/usr/share/pixmaps/
  cp -rf ./misc/fetion.png ${pkgdir}/usr/share/pixmaps/
  chmod 644 ${pkgdir}/usr/share/pixmaps/fetion.png

  mkdir -p ${pkgdir}/usr/share/app-install/icons/
  cp ./misc/fetion.png ${pkgdir}/usr/share/app-install/icons/
  chmod 644 ${pkgdir}/usr/share/app-install/icons/fetion.png

  mkdir -p ${pkgdir}/usr/share/libfetion/
  cp -rf README COPYING ChangeLog CREDITS.txt resource skins ${pkgdir}/usr/share/libfetion/
  chmod -R 755 ${pkgdir}/usr/share/libfetion/
  find ${pkgdir}/usr/share/libfetion/ -type d -exec chmod 755 {} \;
  find ${pkgdir}/usr/share/libfetion/ -type f -exec chmod 644 {} \;

  mkdir -p ${pkgdir}/usr/share/applications/
  cp -rf ./misc/LibFetion.desktop ${pkgdir}/usr/share/applications/
  chmod 644 ${pkgdir}/usr/share/applications/LibFetion.desktop

  mkdir -p ${pkgdir}/usr/bin
  cp -rf linux-fetion ${pkgdir}/usr/bin
  strip ${pkgdir}/usr/bin/linux-fetion
  chmod +x ${pkgdir}/usr/bin/linux-fetion
}
