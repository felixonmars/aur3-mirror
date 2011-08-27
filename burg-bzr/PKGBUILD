# Contributor: cruznick <cruznick@archlinux.us>
# Maintainer:  fsckd <fsckdaemon@gmail.com>

# Tunables: change y to n to disable
_mk_burg_emu=${_mk_burg_emu:-y}        # enable burg emu
_rm_bld_dirs=${_rm_bld_dirs:-n}        # remove build directories

pkgname=burg-bzr
pkgver=1844
pkgrel=4
pkgdesc="Brand-new Universal loadeR from GRUB"
url="http://code.google.com/p/burg/"
license="GPL3"
arch=('i686' 'x86_64')
depends=('ruby' 'python2' 'gettext' 'freetype2' 'sdl' 'ncurses')
optdepends=('os-prober' 'memtest86+')
makedepends=('bzr')
conflicts=('burg' 'burg-emu')
replaces=('burg-emu')
provides=('burg' 'burg-emu')
#options=('!makeflags')
changelog=burg.changelog
backup=('etc/default/burg' 'etc/burg.d/40_custom')
sha256sums=('e94ee55a1fa9cadb5d752c40df6060c0b5c6b42f6f69440d24642b483255b05a'  # burg.default
            '57fa4d1ab439a3e716cf60f5eda533969f8d4a46b6425e85f0529d1897897446'  # arch patch
            '31edd8578c337be2f02dae8a292b5c53d34b107ab255634698794f999a293506'  # memtest
            '646d55a233706329ecc9b4b6d0eb0460e6d37b84ebbe3e15c3176cbd23bf075b') # update-burg
source=('burg.default' 'arch-burg.patch' '20_memtest86+' 'update-burg')
install='burg.install'

_bzrmod=burg
_bzrtrunk=lp:$_bzrmod

_build_dir() {
  local rm_bdir=0
  local bdir="$_bzrmod-build"
  while (( "$#" ))
  do
    [[ "$1" == '-r' ]] && rm_bdir=1 \
                       || bdir="$_bzrmod-$1-build"
    shift
  done
  rm -rf "$srcdir/$bdir"
  if [[ $rm_bdir == 0 ]] ; then
    cp -rip "$srcdir/$_bzrmod" "$srcdir/$bdir"
    cd "$srcdir/$bdir"
  fi
}

_build_common() {
  # Archlinux changed default /usr/bin/python to 3.1.2
  # need to use /usr/bin/python2 instead
  sed -i 's|python|python2|' autogen.sh
  ./autogen.sh
}

build() {
  cd "$srcdir"

  msg "Connecting to the server...."
  if [[ ! -d ./$_bzrmod ]] ; then
    bzr branch $_bzrtrunk -r $pkgver
  else
    cd $_bzrmod && bzr pull -r $pkgver
  fi
  msg "BZR checkout done or server timeout"

  msg "Building burg...."
  _build_dir
  # some random patches to facilitate automatic creation of grub.cfg
  patch -Np1 -i  "$srcdir/arch-burg.patch"
  _build_common
  local configopts="--prefix=/usr --bindir=/bin \
                    --sbindir=/sbin --mandir=/usr/share/man \
                    --infodir=/usr/share/info --sysconfdir=/etc \
                    --disable-werror"
  ./configure $configopts
  make
  make install "DESTDIR=$pkgdir"
  [[ $_rm_bld_dirs == y ]] && _build_dir -r

  if [[ $_mk_burg_emu == y ]] ; then
    msg "Building burg-emu...."
    _build_dir emu
    _build_common
    configopts="$configopts --with-platform=emu --disable-grub-emu-usb"
    ./configure $configopts
    make
    install -D -m0755 grub-emu "$pkgdir/bin/burg-emu"
    [[ $_rm_bld_dirs == y ]] && _build_dir -r emu
  fi

  # install /etc/default/burg(needed config file)
  install -D -m0644 "$srcdir/burg.default" "$pkgdir/etc/default/burg"
  # install update-burg script
  install -D -m0755 "$srcdir/update-burg" "$pkgdir/sbin/update-burg"
  # install memtest config detection
  install -D -m0755 "$srcdir/20_memtest86+" "$pkgdir/etc/burg.d/20_memtest86+"
}
