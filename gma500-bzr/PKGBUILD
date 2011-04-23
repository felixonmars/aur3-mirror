pkgname=('xorg-x11-drv-psb-bzr')
pkgbase=gma500-bzr
pkgver=5
pkgrel=1
pkgdesc="Poulsbo driver"
arch=('i686')
url="https://launchpad.net/~gma500/"
license=('MIT')
groups=('poulsbo')
depends=('glibc' 'xorg-server' 'mesa')
makedepends=('xf86driproto>=2.1.0' 'glproto>=1.4.10' 'xorg-util-macros>=1.3.0' 'xf86dgaproto' 'xineramaproto' 'xorg-server-devel' 'bzr')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_bzrtrunk="http://bazaar.launchpad.net/~gma500/+junk/gma500-natty/"
_bzrmod="gma500-natty"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #

  cd xserver-xorg-video-psb/;

  #apply patches
  for i in `grep -v "^#" debian/patches/series`;
  do
      patch -Np1 -i debian/patches/$i || return 1;
  done

  #change characterset of man page to utf-8
  iconv -f iso-8859-15 -t utf-8 -o man/psb.man.utf8 man/psb.man && mv man/psb.man.utf8 man/psb.man

  #compile
  autoreconf -i;

  CFLAGS="-fvisibility=default" ./configure --prefix=/usr --disable-static;
  make || return 1;
}

package_xorg-x11-drv-psb-bzr () {
    pkgrel=2
    depends=('glibc' 'xpsb-glx>=0.18' 'xorg-server>=1.10.0' 'psb-kmod>=4.41.1' 'psb-firmware>=0.30' 'libdrm-poulsbo>=2.3.0' 'mesa')
    conflicts=('xorg-x11-drv-psb')
    replaces=('xorg-x11-drv-psb')

    cd ${srcdir}/$_bzrmod-build/xserver-xorg-video-psb/;

    #install
    make DESTDIR=${pkgdir}/ install;

    #copy the modprobe config
    install -dm 755 ${pkgdir}/etc/modprobe.d/
    install -m 644 ${srcdir}/$_bzrmod-build/poulsbo-config/etc/modprobe.d/poulsbo.conf ${pkgdir}/etc/modprobe.d/poulsbo.conf

    #copy MIT license over
    install -dm 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -m 644 MIT_License.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
