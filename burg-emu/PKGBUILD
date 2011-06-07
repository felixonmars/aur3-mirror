# Maintainer: cruznick <cruznick@archlinux.us>
# Maintainer: fsckd <fsckdaemon@gmail.com>

pkgname=burg-emu
pkgver=1844
pkgrel=2
pkgdesc="A brand-new boot loader based on GRUB.(emu)"
url="https://launchpad.net/burg"
license="GPL3"
arch=('i686' 'x86_64')
depends=('ruby' 'python2' 'gettext' 'freetype2' 'sdl' 'ncurses' 'burg-bzr')
makedepends=('bzr')
conflicts=(burg-emu-fixed)
replaces=(burg-emu-fixed)
provides=('burg-emu')
install='burg-emu.install'

_bzrmod=burg
_bzrtrunk=lp:${_bzrmod}

build() {
 cd $srcdir/

msg "Connecting to the server...."
  if [ ! -d ./${_bzrmod} ]; then
   bzr branch ${_bzrtrunk} -r ${pkgver}
    else
   cd ${_bzrmod} && bzr pull -r ${pkgver}
  fi
  msg "BZR checkout done or server timeout"
  cd "${srcdir}/${_bzrmod}"
  ## Archlinux changed default /usr/bin/python to 3.1.2, need to use /usr/bin/python2 instead
  sed -i 's|python|python2|' ${srcdir}/${_bzrmod}/autogen.sh
 ./autogen.sh || return 1
}
package() {
provides=('burg-emu')
install='burg-emu.install'
msg "Removing old build directory..."
rm -rf $srcdir/$_bzrmod-emu-build
msg "Creating build directory..."
mkdir $srcdir/$_bzrmod-emu-build
cd $srcdir/$_bzrmod-emu-build
$srcdir/$_bzrmod/configure --with-platform=emu --disable-grub-emu-usb --prefix=/opt/burg-emu --disable-werror || return 1
make 
make install DESTDIR=$pkgdir 
# creating symbolic link to /bin this will be fixed when I finish mapping files
mkdir $pkgdir/bin
ln -s $pkgdir/opt/burg-emu/bin/burg-emu $pkgdir/bin
}
