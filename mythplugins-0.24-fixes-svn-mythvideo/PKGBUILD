# Maintainer: Jannik Sost <jannik.sost at gmail.com>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=mythplugins-0.24-fixes-svn
pkgname=mythplugins-0.24-fixes-svn-mythvideo
pkgver=27371
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.mythtv.org"
license=('GPL')
makedepends=("mythtv-0.24-fixes-svn" 'cdrkit' 'dvdauthor' 'dvd+rw-tools' 'ffmpeg'
             'python-imaging' 'libexif' 'perl-date-manip' 'zlib' 'cdparanoia'
             'flac' 'libcdaudio' 'libvisual' 'libvorbis' 'sdl' 'taglib'
             'python2-oauth' 'python-pycurl' 'mplayer' 'perl-date-manip'
             'perl-libwww' 'perl-soap-lite' 'perl-xml-sax' 'perl-xml-simple'
             'perl-xml-xpath' 'perl-image-size' 'perl-datetime-format-iso8601' 
	     'subversion')
options=('force')
source=('mtd.rc')
md5sums=('476c12ba074794ad7f4ae092bdf949d6')

_svntrunk="http://code.mythtv.org/svn/branches/release-0-24-fixes/mythplugins"                                                                                                                        
_svnmod=mythplugins

build() {
  cd "$srcdir"                                                                                                                          
                                                                                                                                        
  if [ -d $_svnmod/.svn ]; then                                                                                                         
    (cd $_svnmod && svn up -r $pkgver)                                                                                                  
  else                                                                                                                                  
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod                                                                               
  fi                                                                                                                                    
                                                                                                                                        
  msg "SVN checkout done or server timeout"                                                                                             
  msg "Starting make..."                                                                                                                
                                                                                                                                        
  rm -rf "$srcdir/$_svnmod-build"                                                                                                       
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"                                                                                     
  cd "$srcdir/$_svnmod-build"

  find . -name '*.py' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  ./configure --prefix=/usr \
	      --disable-all \
              --enable-mythvideo \
               --python=python2
  qmake mythplugins.pro
  make
}


package_mythplugins-0.24-fixes-svn-mythvideo() {
  pkgdesc="Video playback and browsing plugin for MythTV"
  depends=("mythtv-0.24-fixes-svn" 'mplayer')
  conflicts=('mythplugins-mythvideo')
  provides=('mythplugins-mythvideo')

  cd "$srcdir/$_svnmod-build/mythvideo"
  make INSTALL_ROOT="$pkgdir" install

  install -D -m755 "$srcdir/mtd.rc" "$pkgdir/etc/rc.d/mtd"
}
