# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdenetwork4-svn
true && pkgname=('kdenetwork4-filesharing-svn' 'kdenetwork4-kdnssd-svn' 'kdenetwork4-kget-svn'
		 'kdenetwork4-kopete-svn' 'kdenetwork4-kppp-svn' 'kdenetwork4-krdc-svn'
		 'kdenetwork4-krfb-svn')
pkgver=1242328
pkgrel=1
pkgdesc="KDE4 Networking Programs"
arch=('i686' 'x86_64')
url="http://www.kde.org"
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'speex' 'ortp' 'libotr' 'qca-ossl'
	     'kdebase4-workspace-git' 'kdebase4-lib-git' 'libvncserver' 'libmsn' 'ppp'
	     'v4l-utils' 'libidn' 'rdesktop' 'qimageblitz' 'libxdamage' 'libgadu' 'telepathy-qt4'
	     'libktorrent' 'libmms' 'mediastreamer')
license=('GPL')
groups=('kde4-git' 'kdenetwork4-svn')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdenetwork
_svnmod=kdenetwork

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi 

  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMOZPLUGIN_INSTALL_DIR=/usr/lib/mozilla/plugins/ \
		-DWITH_Xmms=OFF \
		-DWITH_LibMeanwhile=OFF
  make
}
package_kdenetwork4-filesharing-svn() {
        pkgdesc='Konqueror properties dialog plugin to share a directory with the local network'
        depends=('kdelibs4-git' 'smbclient')
	conflicts=('kdenetwork-filesharing')
        install='kdenetwork4-svn.install'
        cd $srcdir/build/filesharing
        make DESTDIR=$pkgdir install
}

package_kdenetwork4-kdnssd-svn() {
        pkgdesc='Monitors the network for DNS-SD services'
        depends=('kdelibs4-git')
	conflicts=('kdenetwork-kdnssd')
        cd $srcdir/build/kdnssd
        make DESTDIR=$pkgdir install
}

package_kdenetwork4-kget-svn() {
        pkgdesc='Download Manager'
        depends=('kdebase4-workspace-git' 'kdebase4-lib-git' 'libktorrent' 'libmms')
        optdepends=('python2: YouTube plugin')
	conflicts=('kdenetwork-kget')
        url="http://kde.org/applications/internet/kget/"
        install='kdenetwork4-svn.install'
        cd $srcdir/build/kget
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kget
        make DESTDIR=$pkgdir install
        find ${pkgdir} -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}

package_kdenetwork4-kopete-svn() {
        pkgdesc='Instant Messenger'
        depends=('kdebase4-runtime-git' 'kdepimlibs4-git' 'qca-ossl' 'libotr' 'libmsn'
                 'libidn' 'qimageblitz' 'v4l-utils' 'libgadu' 'mediastreamer')
	conflicts=('kdenetwork-kopete')
        url="http://kde.org/applications/internet/kopete/"
        install='kdenetwork4-svn.install'
        cd $srcdir/build/kopete
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kopete
        make DESTDIR=$pkgdir install
}

package_kdenetwork4-kppp-svn() {
        pkgdesc='Internet Dial-Up Tool'
        depends=('kdebase4-runtime-git' 'ppp')
	conflicts=('kdenetwork-kppp')
        url="http://kde.org/applications/internet/kppp/"
        install='kdenetwork4-svn.install'
        cd $srcdir/build/kppp
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kppp
        make DESTDIR=$pkgdir install
}

package_kdenetwork4-krdc-svn() {
        pkgdesc='Remote Desktop Client'
        depends=('kdebase4-runtime-git' 'libvncserver' 'rdesktop' 'telepathy-qt4')
	optdepends=('kdebase4-keditbookmarks-git: to edit bookmarks')
	conflicts=('kdenetwork-krdc')
        url="http://kde.org/applications/internet/krdc/"
        cd $srcdir/build/krdc
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/krdc
        make DESTDIR=$pkgdir install
}
 
package_kdenetwork4-krfb-svn() {
        pkgdesc='Desktop Sharing'
        depends=('kdebase4-runtime-git' 'libvncserver' 'libxdamage')
	conflicts=('kdenetwork-krfb')
        cd $srcdir/build/krfb
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/krfb
        make DESTDIR=$pkgdir install
}