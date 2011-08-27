# Maintainer: Jannik Sost <jannik.sost at gmail.com>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv-0.24-fixes-svn
pkgver=27419
pkgrel=2
pkgdesc="A Homebrew PVR project"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=('lame' 'libavc1394' 'libiec61883' 'libvdpau' 'libxinerama' 'libxvmc'
         'lirc-utils' 'mesa' 'mysql-clients' 'mysql-python' 'perl-dbd-mysql'
         'perl-libwww' 'perl-net-upnp' 'python-lxml' 'qt' 'wget')
makedepends=('yasm' 'subversion')
conflicts=('mythtv')
provides=('mythtv')
optdepends=('xmltv: to download tv listings')
backup=('etc/conf.d/mythbackend')
options=('force')
install='mythtv.install'
source=('mythbackend.rc'
	'mythbackend.conf')
md5sums=('feadcc9ad064d93d6dceab1efc0bd9ed'
         'bb8e4033d82428d827570fae9ba15e6a')

_svntrunk="http://code.mythtv.org/svn/branches/release-0-24-fixes/mythtv"
_svnmod=mythtv

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

  find 'bindings/python' 'contrib' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  ARCH="${CARCH/_/-}"
  ./configure --prefix=/usr --cpu="$ARCH" \
              --enable-mmx \
              --enable-audio-oss \
              --enable-audio-alsa \
              --disable-audio-jack \
              --disable-audio-pulse \
              --disable-altivec \
              --disable-distcc \
              --disable-ccache \
              --enable-vdpau \
              --enable-dvb \
              --dvb-path=/usr/include \
              --enable-lirc \
              --enable-joystick-menu \
              --enable-v4l \
              --enable-ivtv \
              --enable-xvmc \
              --enable-xvmcw \
              --enable-xvmc-vld \
              --enable-firewire \
              --enable-opengl-vsync \
              --enable-xrandr \
              --enable-xv \
              --enable-x11 \
              --with-bindings=perl,python --python=python2
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make INSTALL_ROOT="$pkgdir" install

  install -D -m755 "$srcdir/mythbackend.rc" "$pkgdir/etc/rc.d/mythbackend"
  install -D -m644 "$srcdir/mythbackend.conf" "$pkgdir/etc/conf.d/mythbackend"
  install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"

  mkdir -p "$pkgdir/usr/share/mythtv/contrib"
  # This is not ideal, as it will include the .svn directory when copying
  # But you may remove /usr/share/mythtv/contrib/.svn after the you installed this package
  cp -R 'contrib' "$pkgdir/usr/share/mythtv"
}
