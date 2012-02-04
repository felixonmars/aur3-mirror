# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=exaile-beta
_pname=exaile
_realver=0.3.1.999-rc1
pkgver=0.3.2
pkgrel=1
pkgdesc="A media player aiming to be similar to KDE's AmaroK, but for GTK+"
arch=('i686' 'x86_64')
url="http://www.exaile.org"
license=('GPL')
depends=('pygtk>=2.10' 'python-pysqlite' 'gstreamer0.10-python' \
         'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' \
         'dbus-python' 'mutagen')
makedepends=('pkgconfig')
optdepends=('cddb-py: for CD playback'
            'libgpod: for iPod suport'
            'gstreamer0.10-ugly-plugins: for mp3 support'
            'gstreamer0.10-ffmpeg: for wma support'
            'gstreamer0.10-bad-plugins: for equalizer support'
            'python-notify: for libnotify plugin'
            'xulrunner: for extended information tabs'
            'gnome-python-extras: for extended information tabs')
conflicts=('exaile' 'exaile-bzr' 'exaile-old')
provides=('exaile')
source=(http://edge.launchpad.net/$_pname/$pkgver/$pkgver-rc1/+download/$_pname-$_realver.tar.gz
        launcher.patch)
md5sums=('759083d91d67517864d5d9e7c830731c'
         '435085d5fdb9a7131118be7be634b2b6')

build() {
  cd $srcdir/$_pname-$_realver
  patch -Np0 < ../launcher.patch
  make  
  make PREFIX=/usr  DESTDIR=${pkgdir} install

  # fix for clicking files with spaces in names from nautilus
  sed -i "s#%u#%f#" ${pkgdir}/usr/share/applications/exaile.desktop
}
# vim:set ts=2 sw=2 et
