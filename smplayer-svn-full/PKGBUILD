# Contributor: Flamelab <panosfilip@gmail.com>
# Fixes and patches: WAntilles <wantilles@adslgr.com>
# Modified for Mplayer-svn qt-git caemir <caemirr@gmail.com>


pkgname=smplayer-svn-full
realname=smplayer
pkgver=3605
pkgrel=1
_realver=0.6.9
pkgdesc="A complete front-end for MPlayer-SVN with QT-GIT and Mplayer2-git "
arch=('i686' 'x86_64')
sourcetarballdir=http://archlinuxgr.tiven.org/sources
url="http://smplayer.sourceforge.net/"
license=('GPL')
depends=('qt-git' 'mplayer2-git')
makedepends=('subversion')
conflicts=('smplayer')
provides=("smplayer=$_realver")
source=("optionally-enable-vdpau-divx-decoder-ng.patch"
         "smplayer-display-matroska-chapter-names.patch"
        "seek-while-pausing-mplayer2-fix.diff")

_svnmod="smplayer"
_svntrunk=https://smplayer.svn.sourceforge.net/svnroot/smplayer/smplayer/trunk/


build()

{
     cd "${srcdir}"

     if [ -d $_svnmod/.svn ]; then
          (cd $_svnmod && svn up -r $pkgver)
     else
          svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
     fi

     msg "SVN checkout done or server timeout"
     msg "Starting make..."

     if [ -d $_svnmod-build ];then
        rm -r $_svnmod-build
     fi
     cp -r $_svnmod $_svnmod-build
     cd $_svnmod-build

  # remove broken translation
  sed -i "s|translations/smplayer_gl.ts|#translations/smplayer_gl.ts|" src/smplayer.pro

  # give the option to enable vdpau divx decoding through smplayer.ini
  patch -Np2 -i ${srcdir}/optionally-enable-vdpau-divx-decoder-ng.patch

  # display matroska container chapter names
  # patch from dikei
  # http://smplayer.berlios.de/forum/viewtopic.php?f=4&t=661
  patch -Np2 -i ${srcdir}/smplayer-display-matroska-chapter-names.patch

  #Patch for this http://smplayer.berlios.de/forum/viewtopic.php?f=4&t=1005
  patch -Np2 -i ${srcdir}/seek-while-pausing-mplayer2-fix.diff

  make PREFIX=/usr
}

package() {
  cd ${srcdir}/$_svnmod-build
  make PREFIX=${pkgdir}/usr install

  install -dm755 ${pkgdir}/usr/share/pixmaps
  ln -s /usr/share/icons/hicolor/64x64/apps/smplayer.png \
        ${pkgdir}/usr/share/pixmaps/

  sed -i 's|Exec=smplayer %U|Exec=smplayer %F|' ${pkgdir}/usr/share/applications/smplayer.desktop
  sed -i 's|Exec=smplayer -add-to-playlist %U|Exec=smplayer -add-to-playlist %F|' \
        ${pkgdir}/usr/share/applications/smplayer_enqueue.desktop
}

md5sums=('8e32350e382d0e9942fbfd8cf323bd86'
         '3adebe0a004123eb3de48c0378c3f4d0'
         '9cfd4e15e0c307ebeebec349b07aa6f7')



