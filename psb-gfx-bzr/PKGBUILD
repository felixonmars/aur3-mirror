pkgname='psb-gfx-bzr'
pkgver=60
pkgrel=1
pkgdesc="Intel GMA500 KMS Framebuffer"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~tista/+junk/psb-gfx-daily"
license=('MIT')
groups=()
depends=('linux>=2.6.39', 'xf86-video-fbdev')
makedepends=('bzr')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=psb-gfx.install
source=()
noextract=()

_bzrtrunk="https://code.launchpad.net/~tista/+junk/psb-gfx-daily"
_bzrmod="psb-gfx"

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
  make
}

package () {
    cd ${srcdir}/$_bzrmod-build/;

    #install
    #make DESTDIR=${pkgdir}/ install;

    # as we don't use dkms, simple copying module to kernel dir

    install -dm 755 ${pkgdir}/lib/modules/$(uname -r)/extra/psb
    install -m 755 psb_gfx.ko ${pkgdir}/lib/modules/$(uname -r)/extra/psb
}
