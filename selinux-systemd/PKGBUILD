# Maintainer: Nicky726 <Nicky726@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=('selinux-systemd')
true && pkgname=('selinux-systemd' 'selinux-systemd-sysvcompat')
_origname=systemd
pkgver=204
pkgrel=3
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
makedepends=('acl' 'cryptsetup' 'dbus-core' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'selinux-pam' 'python' 'quota-tools' 'xz' 'selinux-usr-libselinux>=2.1.9')
options=('!libtool')
source=("http://www.freedesktop.org/software/$_origname/$_origname-$pkgver.tar.xz"
        0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
        0001-journald-DO-recalculate-the-ACL-mask-but-only-if-it-.patch
        'initcpio-hook-udev'
        'initcpio-install-udev'
        'initcpio-install-timestamp')
md5sums=('a07619bb19f48164fbf0761d12fd39a8'
         '7f39f9fde1ff7b48293ed1e3d0a6c213'
         '66e3162856ded8eb7dc7383405c6e0d6'
         'e99e9189aa2f6084ac28b8ddf605aeb8'
         'fb37e34ea006c79be1c54cbb0f803414'
         'df69615503ad293c9ddf9d8b7755282d')

prepare() {
  cd "$_origname-$pkgver"

  patch -Np1 <"$srcdir/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch"

  patch -Np1 <"$srcdir/0001-journald-DO-recalculate-the-ACL-mask-but-only-if-it-.patch"

  autoreconf
}

build() {
  cd "$_origname-$pkgver"

  ./configure \
      --enable-static \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --enable-selinux \
      --enable-audit \
      --disable-ima \
      --with-sysvinit-path= \
      --with-sysvrcnd-path= \
      --with-firmware-path="/usr/lib/firmware/updates:/usr/lib/firmware"

  make
}

check() {
  # two tests fail due to running under nspawn
  make -C "$_origname-$pkgver" check || true
}

package_selinux-systemd() {
  pkgdesc="SELinux aware system and service manager"
  groups=('selinux' 'selinux-system-utilities')
  depends=('acl' 'bash' 'dbus-core' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt'
           'selinux-pam' 'selinux-util-linux' 'xz' 'selinux-usr-libselinux' 'audit')
  provides=("libsystemd=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver" "udev=$pkgver" 
            "selinux-udev=${pkgver}" "${_origname}=${pkgver}-${pkgrel}" "${_origname}-tools=${pkgver}-${pkgrel}"
            'libgudev-1.0.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
            'libsystemd-journal.so' 'libsystemd-login.so' 'libudev.so')
  replaces=('libsystemd' 'nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('libsystemd' 'nss-myhostname' 'systemd-tools' 'udev' "${_origname}")
  optdepends=('initscripts: legacy support for /etc/rc.conf'
              'python: systemd library bindings'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries')
  backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
          etc/dbus-1/system.d/org.freedesktop.hostname1.conf
          etc/dbus-1/system.d/org.freedesktop.login1.conf
          etc/dbus-1/system.d/org.freedesktop.locale1.conf
          etc/dbus-1/system.d/org.freedesktop.timedate1.conf
          etc/systemd/system.conf
          etc/systemd/user.conf
          etc/systemd/logind.conf
          etc/systemd/journald.conf
          etc/udev/udev.conf)
  install="systemd.install"

  make -C "$_origname-$pkgver" DESTDIR="$pkgdir" install

  printf "d /run/console 0755 root root\n" > "$pkgdir/usr/lib/tmpfiles.d/console.conf"

  # fix .so links in manpage stubs
  find "$pkgdir/usr/share/man" -type f -name '*.[[:digit:]]' \
      -exec sed -ri '1s|^\.so (.*)\.([0-9]+)|.so man\2/\1.\2|' {} +

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  # get rid of RPM macros
  rm -r "$pkgdir/etc/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "systemd-$pkgver/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules

  # add mkinitcpio hooks
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"
  install -Dm644 "$srcdir/initcpio-install-timestamp" "$pkgdir/usr/lib/initcpio/install/timestamp"

  ### split out manpages for sysvcompat
  rm -rf "$srcdir/_sysvcompat"
  install -dm755 "$srcdir"/_sysvcompat/usr/share/man/man8/
  mv "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     "$srcdir"/_sysvcompat/usr/share/man/man8
}

package_selinux-systemd-sysvcompat() {
  pkgdesc="SELinux aware sysvinit compat for systemd"
  conflicts=('sysvinit' 'selinux-sysvinit' "${_origname}-sysvcompat")
  provides=("${_origname}-sysvcompat=${pkgver}-${pkgrel}")
  groups=('selinux' 'selinux-system-utilities')
  depends=('sysvinit-tools' 'selinux-systemd')

  mv "$srcdir/_sysvcompat"/* "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

# vim: ft=sh syn=sh et
