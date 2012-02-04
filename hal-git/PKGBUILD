# The GIT version of HAL. I made this one because HAL 0.5.14
# had some issues for me. Good luck!

# Contributor: Wintershade <Wintershade[no_spam]<AT>[no_spam]gmail<DOT>com>
pkgname=hal-git
pkgver=20100217
pkgrel=1
pkgdesc="Hardware Abstraction Layer - the GIT version from freedesktop.org"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/hal"
license=('GPL')
groups=()
depends=('dbus-glib>=0.82' 'libusb>=0.1.12' 'udev>=146' 'filesystem>=0.7.1-5' 'hal-info>=0.20090716' 'eject' 'dmidecode' 'pciutils>=3.0.2' 'usbutils>=0.73-5' 'pm-utils>=1.2.5' 'consolekit>=0.4.1' 'util-linux-ng>=2.16')
makedepends=('pkgconfig' 'gperf' 'git')
provides=('hal=0.5.15')
conflicts=()
replaces=(hal)
backup=()
options=('!libtool')
install=hal.install
source=(hal)
noextract=()
md5sums=(277e96ac130d7bfce0b30f0b80db8782) #generate with 'makepkg -g'

_gitroot="git://anongit.freedesktop.org/hal"
_gitname="hal-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "A little housekeeping..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting the configure..." # I've just copy-pasted the configure options from the Arch stock hal PKGBUILD.
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/hal --with-udev-prefix=/etc \
      --enable-static=no --disable-acpi-ibm \
      --disable-docbook-docs --disable-console-kit \
      --disable-policy-kit --disable-acl-management \
      --enable-umount-helper --disable-smbios \
      --with-hal-user=hal --with-hal-group=hal \
      --with-pid-file=/var/run/hald.pid || return 1

  msg "Configure finished. Now running make. Good luck!"
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/etc/rc.d"
  install -m755 -d "${pkgdir}/media" || return 1
  install -m755 "${srcdir}/hal" "${pkgdir}/etc/rc.d/" || return 1

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
} 
