# Archlive <http://archlive-pkg.googlecode.com>

pkgname=oss-hg
pkgver=894
pkgrel=1
pkgdesc="Open Sound System UNIX audio architecture"
arch=('i686' 'x86_64')
url="http://www.opensound.com/"
license=('GPL2')
depends=('module-init-tools' 'libtool' 'sed')
makedepends=('pkgconfig' 'gawk' 'gtk2' 'mercurial' 'gcc' 'make')
provides=('oss' 'oss4')
conflicts=('oss-linux' 'oss-linux-free' 'oss-testing' 'oss' 'oss-mercurial')
install='oss.install'
backup=('usr/lib/oss/soundon.user')
source=('oss.rm-init-scripts.patch' 'oss.soundon.patch' 'oss.rc' 'oss.install'
	 'ossxmix.png' 'ossxmix.desktop')
md5sums=()

optdepends=('gtk2: for graphical mixer (ossxmix)'
            'hal: for automatic USB audio configuration')

_hgroot="http://opensound.hg.sourceforge.net:8000/hgroot/opensound/opensound"
_hgrepo="oss"


build() {
  cd $startdir

  if [ -d ${_hgrepo} ]; then
      cd ${_hgrepo} && hg pull -u -r ${pkgver}
  else
      hg clone ${_hgroot} ${_hgrepo} || return 1
  fi
  
  [ -d $srcdir/${_hgrepo} ] && rm -rf $srcdir/${_hgrepo}
  hg clone $startdir/${_hgrepo} $srcdir/${_hgrepo}
  cd $srcdir/${_hgrepo}

  # Avoid these flags conflicting with OSS build system.
  unset CFLAGS
  unset OSFLAGS
  unset LIBRARIES
  export NO_WARNING_CHECKS=yes

  # Compile libflashsupport.so only in packaging time, so we avoid
  # conflicts with other packages and ease package management.
  msg "Building libflashsupport.so."
  cd "oss/lib"
  gcc -shared -fPIC -O2 -Wall -Werror flashsupport.c -o libflashsupport.so || return 1
  install -Dm755 libflashsupport.so "${pkgdir}/usr/lib/libflashsupport.so" || return 1
  #rm -f "flashsupport.c" "libflashsupport.so" &> /dev/null

  msg "Preparing the build environment."
  cd $srcdir/${_hgrepo}
  [ -d build ] && rm -rf build
  mkdir build && cd build
  ../configure --regparm --config-midi=YES --enable-timings --portable-build || return 1
  #../configure --enable-libsalsa=YES || return 1

  msg "Building OSS."
  make build || return 1

  msg "Patching init scripts."
  cd prototype
  rm usr/lib/oss/etc/S89oss
  patch -Np0 -i "$srcdir/oss.rm-init-scripts.patch" || return 1
  patch -Np0 -i "$srcdir/oss.soundon.patch" || return 1

  msg "Copying files."
  cp -a * "${pkgdir}"
  chmod -R a+r "${pkgdir}" 
  find "${pkgdir}" -type d -exec chmod a+x '{}' \;
  install -D -m755 "$srcdir/oss.rc" "$pkgdir/etc/rc.d/oss4"
  install -D -m755 "$srcdir/ossxmix.desktop" "$pkgdir/usr/share/applications/ossxmix.desktop"
  install -D -m644 "$srcdir/ossxmix.png" "$pkgdir/usr/share/pixmaps/ossxmix.png"
}
md5sums=('b9a380a0ac8896390d71ac13676f27e1'
         '65f07fe241bfbf912f76d8b6d8f276b5'
         'b70f139f73c2f1ee9db2680ce48121fb'
         '1494a2304a1eb7a1979e7e83d894c67a'
         'f6a0fa9d274d21ab92cd03fca885add7'
         '81e0f51ec04379dee64c31c32b045028')
