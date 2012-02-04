pkgname=exaile-old
_realname=exaile
pkgver=0.2.14
pkgrel=4
pkgdesc="A media player aiming to be similar to KDE's AmaroK, but for GTK+"
arch=('i686' 'x86_64')
url="http://www.exaile.org"
license=('GPL')
depends=('python2' 'pygtk>=2.10' 'python-pysqlite' 'gstreamer0.10-python' \
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
source=(http://www.exaile.org/files/${_realname}\_${pkgver}.tar.gz
        exaile-launcher.patch)
provides=('exaile')
conflicts=('exaile')
md5sums=('5e569c084134abe13d651f804812b6fa'
         '61f260bd5e1610a42acf02ca35c16268')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  patch -Np1 -i ${srcdir}/exaile-launcher.patch

  # python2 fix
  for file in $(find . -name Makefile -print); do
      sed -i 's_python_python2_' $file
  done
  for file in $(find . -name Makefile -print); do
      sed -i 's_-bzr version-info --format=python2_-bzr version-info --format=python_' $file
  done
  for file in $(find . -name "*.py" -print); do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
      sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
  done

  export PYTHON=python2
  make || return 1
  make PREFIX=/usr DESTDIR=${pkgdir} install

  # fix for clicking files with spaces in names from nautilus
  sed -i "s#%u#%f#" ${pkgdir}/usr/share/applications/exaile.desktop
}
