# $Id$
# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=systemd-quiet
_pkgname=systemd
pkgver=37
pkgrel=1
pkgdesc="Session and Startup manager"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2')
depends=('dbus-core' 'kbd' 'libcap' 'util-linux>=2.19' 'udev>=172')
makedepends=('gperf' 'cryptsetup' 'gtk2' 'intltool' 'libnotify')
optdepends=('cryptsetup: required for encrypted block devices'
            'dbus-python: systemd-analyze'
            'gtk2: systemadm'
            'initscripts: legacy support for hostname and vconsole setup'
            'initscripts-systemd: native boot and initialization scripts'
            'libnotify: systemadm'
            'python2-cairo: systemd-analyze'
            'systemd-arch-units: collection of native unit files for Arch daemon/init scripts')
groups=('systemd')
options=('!libtool' '!strip')
conflicts=('systemd')
provides=("systemd=${pkgver}")
backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
        etc/dbus-1/system.d/org.freedesktop.hostname1.conf
        etc/dbus-1/system.d/org.freedesktop.login1.conf
        etc/dbus-1/system.d/org.freedesktop.locale1.conf
        etc/dbus-1/system.d/org.freedesktop.timedate1.conf
        etc/systemd/system.conf
        etc/systemd/user.conf
        etc/systemd/systemd-logind.conf)
install=systemd.install
source=("http://www.freedesktop.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"
        "os-release"
        "systemctl-completion.patch"
        # Quiet patches
        "no-plymouth.patch"
        "fastboot.patch")
md5sums=('1435f23be79c8c38d1121c6b150510f3'
         '752636def0db3c03f121f8b4f44a63cd'
         '8682322fb31cf10ca7a21a958892a226'
         'cd0637d840e68ac157a4fd6fd788cf65'
         '4277e8ba1b1b01767ed94f45e126e6ec')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Do not switch on show_status unconditionally when plymouth is running
  # systemd's Verbosity can be enabled using systemd.show_status=1
  # or compiling plymouth with --enable-systemd-integration
  patch -Np1 -i ${srcdir}/no-plymouth.patch
  # Enable fastboot kernel parameter to skip fsck
  patch -Np1 -i ${srcdir}/fastboot.patch

  # Don't unset locale in getty
  # https://bugzilla.redhat.com/show_bug.cgi?id=663900
  sed -i -e '/^Environ.*LANG/s/^/#/' \
         -e '/^ExecStart/s/agetty/& -8/' units/getty@.service.m4

  # fix bash completion
  patch -Np1 < "$srcdir"/systemctl-completion.patch

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib/systemd \
              --libdir=/usr/lib \
              --localstatedir=/var \
              --with-rootdir= \
              --with-rootlibdir=/lib \
              --disable-audit

  make

  # fix .so links in manpages
  sed -i 's|\.so halt\.8|.so systemd.halt.8|' man/{halt,poweroff}.8
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/os-release" "${pkgdir}/etc/os-release"
  printf "d /run/console 755 root root\n" > "${pkgdir}/usr/lib/tmpfiles.d/console.conf"

  # fix systemd-analyze for python2
  sed -i '1s/python$/python2/' "${pkgdir}/usr/bin/systemd-analyze"

  # rename man pages to avoid conflicts with sysvinit
  cd "${pkgdir}/usr/share/man/man8"
  for manpage in telinit halt reboot poweroff runlevel shutdown; do
    mv {,systemd.}"$manpage.8"
  done
}
