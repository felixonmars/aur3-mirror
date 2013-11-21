# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Alexey Kovyrshin <kovyale@gmail.com>

pkgname=systemd-ak
_pkgname=systemd
pkgver=208
pkgrel=2
pkgdesc="system and service manager with fix for Bug 70267 - systemd 208-1 handle lid switch hibernate"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')

makedepends=('acl' 'cryptsetup' 'dbus-core' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam' 'python' 'quota-tools' 'xz')

options=('strip' 'debug')

depends=('acl' 'bash' 'dbus-core' 'glib2' 'kbd' 'kmod' 'hwids' 'libcap' 'libgcrypt' 'pam' 'util-linux' 'xz')

provides=('systemd' "libsystemd=$pkgver" 'nss-myhostname' "systemd-tools=$pkgver" 
          "udev=$pkgver" 'libgudev-1.0.so' 'libsystemd-daemon.so' 'libsystemd-id128.so'
          'libsystemd-journal.so' 'libsystemd-login.so' 'libudev.so')

replaces=('systemd' 'libsystemd' 'nss-myhostname' 'systemd-tools' 'udev')

conflicts=('systemd' 'libsystemd' 'nss-myhostname' 'systemd-tools' 'udev')

optdepends=('cryptsetup: required for encrypted block devices'
            'libmicrohttpd: systemd-journal-gatewayd'
            'quota-tools: kernel-level quota management'
            'python: systemd library bindings'
            'systemd-sysvcompat: symlink package to provide sysvinit binaries')

backup=(etc/dbus-1/system.d/org.freedesktop.systemd1.conf
        etc/dbus-1/system.d/org.freedesktop.hostname1.conf
        etc/dbus-1/system.d/org.freedesktop.login1.conf
        etc/dbus-1/system.d/org.freedesktop.locale1.conf
        etc/dbus-1/system.d/org.freedesktop.machine1.conf
        etc/dbus-1/system.d/org.freedesktop.timedate1.conf
        etc/pam.d/systemd-user
        etc/systemd/bootchart.conf
        etc/systemd/journald.conf
        etc/systemd/logind.conf
        etc/systemd/system.conf
        etc/systemd/user.conf
        etc/udev/udev.conf)

install="systemd.install"

source=("http://www.freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz"
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        '0001-fix-lingering-references-to-var-lib-backlight-random.patch'
        '0001-mount-check-for-NULL-before-reading-pm-what.patch'
        '0001-shared-util-fix-off-by-one-error-in-tag_to_udev_node.patch'
        '0002-fix-operation-not-supported-to-hibernate-to-swap-file.patch')

md5sums=('df64550d92afbffb4f67a434193ee165'
         '29245f7a240bfba66e2b1783b63b6b40'
         '8b68b0218a3897d4d37a6ccf47914774'
         'bde43090d4ac0ef048e3eaee8202a407'
         '1b191c4e7a209d322675fd199e3abc66'
         'a693bef63548163ffc165f4c4801ebf7'
         'ccafe716d87df9c42af0d1960b5a4105'
         'e71d15d58c44f94510451268f3582789')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 < "$srcdir"/0001-fix-lingering-references-to-var-lib-backlight-random.patch
  patch -Np1 < "$srcdir"/0001-mount-check-for-NULL-before-reading-pm-what.patch
  patch -Np1 < "$srcdir"/0001-shared-util-fix-off-by-one-error-in-tag_to_udev_node.patch
  patch -Np0 < "$srcdir"/0002-fix-operation-not-supported-to-hibernate-to-swap-file.patch
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-audit \
      --disable-ima \
      --with-sysvinit-path= \
      --with-sysvrcnd-path= \
      --with-firmware-path="/usr/lib/firmware/updates:/usr/lib/firmware"

  make
}

check() {
  make -C "$_pkgname-$pkgver" check || :
}

package() {

  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install

  printf "d /run/console 0755 root root\n" > "$pkgdir/usr/lib/tmpfiles.d/console.conf"

  # fix .so links in manpage stubs
  find "$pkgdir/usr/share/man" -type f -name '*.[[:digit:]]' \
      -exec sed -ri '1s|^\.so (.*)\.([0-9]+)|.so man\2/\1.\2|' {} +

  # don't write units to /etc by default -- we'll enable this on post_install
  # as a sane default
  rm "$pkgdir/etc/systemd/system/getty.target.wants/getty@tty1.service"
  rmdir "$pkgdir/etc/systemd/system/getty.target.wants"

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "systemd-$pkgver/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules

  # add mkinitcpio hooks
  install -Dm644 "$srcdir/initcpio-install-systemd" "$pkgdir/usr/lib/initcpio/install/systemd"
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"

  # ensure proper permissions for /var/log/journal
  chown root:systemd-journal "$pkgdir/var/log/journal"
  chmod 2755 "$pkgdir/var/log/journal"

  ### clear out manpages for sysvcompat
  rm -f "$pkgdir"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 

  # include MIT license, since it's technically custom
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.MIT" \
      "$pkgdir/usr/share/licenses/systemd/LICENSE.MIT"
}

# vim: ft=sh syn=sh et
