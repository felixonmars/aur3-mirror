# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Based on official Qemu-kvm PKGBUILD

pkgname=kvm-git
pkgver=20121202
pkgrel=1
pkgdesc="Qemu-KVM emulator - git version"
arch=(i686 x86_64)
url="http://www.linux-kvm.org/page/Main_Page"
license=('GPL')
depends=('libjpeg' 'libpng' 'libsasl' 'curl' 'sdl' 'alsa-lib' 'nss' 'glib2' 'gnutls' 'bluez' 'vde2' 'util-linux-ng' 'libpulse' 'spice')
makedepends=('git' 'texi2html' 'perl')
provides=('qemu')
conflicts=('qemu')
replaces=('kvm')
backup=(etc/qemu/target-x86_64.conf)
options=(!strip)
install='kvm-git.install'
source=('kvm-git.install'
        '65-kvm.rules')
noextract=()
md5sums=('6540bf1723d0571af45bc11ded95fb7e'
         'b316a066d2f1bb57d8f5b7ea1d0d1caf')
_gitroot="git://git.kernel.org/pub/scm/virt/kvm/qemu-kvm.git"
_gitname="qemu-kvm"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr --audio-drv-list=alsa,oss,sdl,pa \
  --audio-card-list=ac97,sb16,es1370,adlib --enable-docs \
  --extra-cflags=-D__EXPORTED__HEADERS__ --disable-werror --python=/usr/bin/python2
  
  make 

  make DESTDIR=${pkgdir} install 
  # symbolic link for backwards compatibility
  ln -s qemu-system-x86_64 ${pkgdir}/usr/bin/qemu-kvm
  # symbolic link for to qemu binary for emulator apps
  ln -s qemu-system-x86_64 ${pkgdir}/usr/bin/qemu
  # symbolic link for to qemu binary for emulator apps
  ln -s qemu-system-x86_64 ${pkgdir}/usr/bin/kvm
  # fix man page
  mv ${pkgdir}/usr/share/man/man1/qemu.1 \
                     ${pkgdir}/usr/share/man/man1/qemu-kvm.1
  # install udev rules
  install -D -m644 ${srcdir}/65-kvm.rules \
                     ${pkgdir}/lib/udev/rules.d/65-kvm.rules
  # strip scripts directory
  find ${pkgdir}/usr/bin  -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "$binary")" in
      *application/x-executable*) # Binaries
      /usr/bin/strip $STRIP_BINARIES "$binary";;
    esac
  done
}
