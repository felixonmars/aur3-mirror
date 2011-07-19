# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdemultimedia4-svn
true && pkgname=('kdemultimedia4-dragonplayer-svn' 'kdemultimedia4-ffmpegthumbs-svn' 'kdemultimedia4-juk-svn'
		 'kdemultimedia4-kioslave-svn' 'kdemultimedia4-kmix-svn' 'kdemultimedia4-kscd-svn' 'kdemultimedia4-mplayerthumbs-svn')
pkgver=1241837
pkgrel=1
url="http://www.kde.org"
license=('GPL')
source=('mplayerthumbs.config')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdelibs4-git' 'tunepimp' 'ffmpeg' 'mplayer' 'pulseaudio' 
	     'libmusicbrainz3' 'subversion')
conflicts=('kdemultimedia')
groups=('kde4-git' 'kdemultimedia4-svn')
install="kdemultimedia4-svn.install"
md5sums=('698c1579905135043dcdd4dbe55f2c7e')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdemultimedia
_svnmod=kdemultimedia

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
		-DWITH_Xine=OFF
  make
}

package_kdemultimedia4-dragonplayer-svn() {
        pkgdesc='Video Player'
        depends=('kdebase4-runtime-git')
	conflicts=('kdemultimedia-dragonplayer')
        url="http://kde.org/applications/multimedia/dragonplayer/"
        install='kdemultimedia4-svn.install'
        cd $srcdir/build/dragonplayer
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/dragonplayer
        make DESTDIR=$pkgdir install
}

package_kdemultimedia4-ffmpegthumbs-svn() {
        pkgdesc='Video Files (ffmpegthumbs)'
        depends=('kdebase4-runtime-git' 'ffmpeg')
	conflicts=('kdemultimedia-ffmpegthumbs')
        install='kdemultimedia4-svn.install'
        cd $srcdir/build/ffmpegthumbs
        make DESTDIR=$pkgdir install
}
 
package_kdemultimedia4-juk-svn() {
        pkgdesc='Music Player'
        depends=('kdebase4-runtime-git' 'tunepimp')
	conflicts=('kdemultimedia-juk')
        url="http://kde.org/applications/multimedia/juk"
        install='kdemultimedia4-svn.install'
        cd $srcdir/build/juk
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/juk
        make DESTDIR=$pkgdir install
}

package_kdemultimedia4-kioslave-svn() {
        pkgdesc='Audio CD Browser'
        depends=('kdelibs4-git' 'libmusicbrainz3' 'cdparanoia')
        conflicts=('kdemultimedia-libkcddb' 'kdemultimedia-libkcompactdisc' 'kdemultimedia-kioslave')
        for i in kioslave doc/kioslave libkcddb libkcompactdisc; do
                cd $srcdir/build/${i}
                make DESTDIR=$pkgdir install
        done
}

package_kdemultimedia4-kmix-svn() {
        pkgdesc='Sound Mixer'
        depends=('kdebase4-runtime-git')
	conflicts=('kdemultimedia-kmix')
        url="http://kde.org/applications/multimedia/kmix"
        install='kdemultimedia4-svn.install'
        cd $srcdir/build/kmix
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kmix
        make DESTDIR=$pkgdir install
}
 
package_kdemultimedia4-kscd-svn() {
        pkgdesc='CD Player'
        depends=('kdebase4-runtime-git' 'libmusicbrainz3')
	conflicts=('kdemultimedia-kscd')
        url="http://kde.org/applications/multimedia/kscd"
        install='kdemultimedia4-svn.install'
        cd $srcdir/build/kscd
        make DESTDIR=$pkgdir install
        cd $srcdir/build/doc/kcontrol/cddbretrieval
        make DESTDIR=$pkgdir install
}

package_kdemultimedia4-mplayerthumbs-svn() {
        pkgdesc='Video Files (MPlayerThumbs)'
        depends=('kdebase4-runtime-git' 'mplayer')
        conflicts=('mplayerthumbs' 'kdemultimedia-mplayerthumbs')
        cd $srcdir/build/mplayerthumbs
        make DESTDIR=$pkgdir install
        install -D -m644 $srcdir/mplayerthumbs.config $pkgdir/usr/share/config/mplayerthumbs
}

arch=('i686' 'x86_64')
pkgdesc="KDE4 Multimedia Programs"