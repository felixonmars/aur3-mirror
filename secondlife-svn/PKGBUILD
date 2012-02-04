# Contributor: Paul Dufresne <dufresnep@gmail.com>
arch=(i686)
pkgname=secondlife-svn
pkgver=224
pkgrel=3
pkgdesc="a 3-D virtual world entirely built and owned by its residents"
url="http://www.secondlife.com"
license=('GPL')
#depends mostly based on the opinion of namcap over mine
depends=('mesa' 'alsa-lib' 'libidn' 'gtk2' 'apr-util' 'sdl' 'nss')
#for next line distcc if you use it to distribute-compile, change DISTCC= on the scons line if you want it
makedepends=('subversion' 'scons' 'gcc34' 'flex' 'bison')
conflicts=('secondlife' 'secondlife-bin')
provides=('secondlife')
install=secondlife.install
source=(
'secondlife.desktop' 'secondlife.install' 'secondlife.launcher'
'http://secondlife.com/developers/opensource/downloads/2008/02/slviewer-artwork-Branch_1-19-0-Viewer-r79209.zip'
'http://secondlife.com/developers/opensource/downloads/2008/02/slviewer-linux-libs-Branch_1-19-0-Viewer-r79209.tar.gz'
'http://secondlife.com/developers/opensource/downloads/2007/12/llmozlib-src-20071221.tar.gz'
'http://www.fmod.org/index.php/release/version/fmodapi375linux.tar.gz'
)
md5sums=('1e94b39e84e74321d40f0ab9fefd3db1'
         'e8222152e75bd8859b72da028fb35963'
         '067f489be9fd2280ce2e12ed94ea7950'
         'c0387ba22f8ae20b2b70995e2f0289cf'
         '6342fea2fc879a71a6aa2e4d08206e32'
         '31b014f75100dcb6105202b29e26bc4c'
         '4fbd42fb8187c37ea454cc66186a1dfa')

_svntrunk=http://svn.secondlife.com/svn/linden/branches/maint-viewer/
_svnmod=mysl

build() {
  cd $startdir/src/

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co -r $pkgver $_svntrunk $_svnmod
  fi
  cp -R -v $startdir/src/linden/* $startdir/src/$_svnmod
  msg "Copy fmod include should go here"
  cd $startdir/src/fmodapi375linux/
  cp api/inc/* $startdir/src/$_svnmod/libraries/i686-linux/include/
  cp api/libfmod-3.75.so $startdir/src/$_svnmod/libraries/i686-linux/lib_release_client/
  msg "End of fmod copy stuff"

  msg "SVN checkout done or server timeout"
  #ln -sf $_svnmod linden

  msg "starting scons (some kind of make written in python)"
  cd $startdir/src/$_svnmod/indra/
  scons BUILD=releasefordownload BTARGET=client DISTCC=no MOZLIB=yes FMOD=yes GSTREAMER=yes STANDALONE=no OPENSOURCE=no || return 1

  msg "let copy llkdu to decode images faster but not being open-source"
  # we could edit indra/newview/viewer_manifest.py before scons but it seems harder to me
  cp $startdir/src/linden/libraries/i686-linux/lib_release_client/libllkdu.so $startdir/src/$_svnmod/indra/newview/packaged/bin
  cp $startdir/src/linden/libraries/i686-linux/lib_release_client/libkdu_v42R.so $startdir/src/$_svnmod/indra/newview/packaged/lib
  msg "end of copu llkdu"
  
  # now we do what slash did to package it, more or less
  msg "now, the installation (Desktop file, Icon file, Launcher, and all the files)"

    # Install Desktop File
    install -D -m644 $startdir/src/secondlife.desktop \
        $startdir/pkg/usr/share/applications/secondlife.desktop

    # Install Icon File, (eh, not the same as slash, but guess it is equivalent)
    install -D -m644 $startdir/src/linden/indra/newview/res/ll_icon.ico \
        $startdir/pkg/usr/share/pixmaps/secondlife.ico

    # Install Launcher
    install -d $startdir/pkg/usr/bin/
    install -D -m755 $startdir/src/secondlife.launcher \
        $startdir/pkg/usr/bin/secondlife

    # Move Data to Destination Directory
    install -d $startdir/pkg/opt/secondlife
    cp -R newview/packaged/* $startdir/pkg/opt/secondlife/

    # Change Permissions of files to root:games, well not sure I buy this idea (pauld)
    #chown -R root:20 $startdir/pkg/opt/secondlife
    #chmod -R g+rw $startdir/pkg/opt/secondlife
}
