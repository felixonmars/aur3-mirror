# Maintainer: Košava <kosava@archlinux.us>
pkgname=cuberok-svn
pkgver=434
pkgrel=1
pkgdesc="Yet another music player based on Qt4. SVN version"
arch=('i686' 'x86_64')
url=('http://code.google.com/p/cuberok/')
license=('GPL')

# Comment/uncomment the lines with the engines you need. GStreamer is a
# dependency of qt, so phonon and gstreamer engines are built by default.
depends=('qt' 'gstreamer0.10-good-plugins'
#         'audiere'                    # Audiere engine
#         'ffmpeg'                     # FFMpeg engine
        )
optdepends=('gstreamer0.10-bad-plugins: GStreamer support for aac'
            'gstreamer0.10-ugly-plugins: GStreamer support for mp3'
            'gstreamer0.10-ffmpeg: GStreamer support for wma'
)
makedepends=('make' 'pkgconfig' 'subversion' 'sed')
conflicts=('cuberok')
provides=('cuberok')

_svntrunk=http://cuberok.googlecode.com/svn/trunk/
_svnmod=cuberok-read-only

build() {
  cd $srcdir
  msg "Connecting to googlecode.com SVN server..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."  
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  # Archlinux compliance
  sed -i 's/64//g' ./plugins/plugins_path-x86-64.pri
  sed -i 's/64//g' ./plugins/plugins_path-x86_64.pri
  #Disable ffmpeg plugin as it is not compiling fine. If you are willing to test, comment it
  sed -i 's/SUBDIRS += plugins\/player_ffmpeg//g' Cuberok.pro
  
  chmod +x unix_build.sh
  ./unix_build.sh
  make INSTALL_ROOT=$pkgdir/usr install
}