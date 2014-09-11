# $Id: PKGBUILD 212847 2014-05-15 17:38:41Z dreisner $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=shadow-dotnames
_pkgname=shadow
pkgver=4.2.1
pkgrel=1
pkgdesc="Password and account management tool suite with support for shadow files and PAM(patched to allow user names with .s)"
arch=('i686' 'x86_64')
url='http://pkg-shadow.alioth.debian.org/'
license=('BSD')
groups=('base')
depends=('bash' 'pam' 'acl')
replaces="shadow"
provides="shadow"
conflicts="shadow"
backup=(etc/login.defs
        etc/pam.d/{chage,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
        etc/pam.d/{chgpasswd,groupmems}
        etc/default/useradd)
options=(strip debug)
install='shadow.install'
source=("http://pkg-shadow.alioth.debian.org/releases/$_pkgname-$pkgver.tar.xz"{,.sig}
        LICENSE
        chgpasswd
        chpasswd
        defaults.pam
        login.defs
        newusers
        passwd
        shadow.{timer,service}
        useradd.defaults
        xstrdup.patch
        shadow-strncpy-usage.patch
        lastlog.tmpfiles
        chkname.c
)
sha256sums=('3b0893d1476766868cd88920f4f1231c4795652aa407569faff802bcda0f3d41'
            'SKIP'
            'b085972a9378ecbe6cafee1a2e9baba1082531c77376c0aa14ad6e5c7392814c'
            'a955ecbd82a801102fad756bb98dca778c1eba14a3367c601d6237b75642c36b'
            '7409cd2ab04592859d95986467123e356ada4e11413b314ad84e32dc24ca8c92'
            'fc6807842f92e9d3f792d6b64a0d5aad87995a279153ab228b1b2a64d9f32f20'
            'eb1f0e6af9aa73abd98d20d18a4dd518b3f2eef63a3d1305f2fa551794f70d54'
            '7409cd2ab04592859d95986467123e356ada4e11413b314ad84e32dc24ca8c92'
            '75428a0f016cccbd9091c012b4d6b778d6ef8d97b607849b5ba1aca0314ed75b'
            '736eb7b16fc2fff9c902d4823641114338f290a6825e66831f41c5474e994207'
            '43f331d50febb87e6f5f5d9f1b2c35f5eab7ffb31cf5139e5a503fb70095a7bf'
            'c74aad1f55e6acba24f7ab24f4a6696e2f35085438f3089dc552b044bc2ebe1d'
            'b7716897579721feb9e2ccbd47639bbd72d2143cf1b9b5dabba5af1bf50bdbf9'
            '42e0b472421192e980696ea8b0e7ba3232985146a32d35c7be7b539cc57221ad'
            'd91ccf5ce4a8b6e3687320100419252d281d6b2a5402a0beba23d0eace641373'
            'd77936a238368cd956adcdefd71bed886a95f46f664010a8372738a1d711df76')

prepare() {
  cd "$_pkgname-$pkgver"

  # need to offer these upstream
  patch -Np1 <"$srcdir/xstrdup.patch"
  patch -Np1 <"$srcdir/shadow-strncpy-usage.patch"

  # supress etc/pam.d/*, we provide our own
  sed -i '/^SUBDIRS/s/pam\.d//' etc/Makefile.in
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    LIBS="-lcrypt" \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --with-libpam \
    --with-group-name-max-length=32 \
    --without-selinux

  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/shadow/LICENSE"

  # useradd defaults
  install -Dm644 "$srcdir/useradd.defaults" "$pkgdir/etc/default/useradd"

  # systemd timer
  install -D -m644 "$srcdir/shadow.timer" "$pkgdir/usr/lib/systemd/system/shadow.timer"
  install -D -m644 "$srcdir/shadow.service" $pkgdir/usr/lib/systemd/system/shadow.service
  install -d -m755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/shadow.timer"

  # login.defs
  install -Dm644 "$srcdir/login.defs" "$pkgdir/etc/login.defs"

  # PAM config - custom
  install -dm755 "$pkgdir/etc/pam.d"
  install -t "$pkgdir/etc/pam.d" -m644 "$srcdir"/{passwd,chgpasswd,chpasswd,newusers}

  # PAM config - from tarball
  install -Dm644 etc/pam.d/groupmems "$pkgdir/etc/pam.d/groupmems"

  # we use the 'useradd' PAM file for other similar utilities
  for file in chage groupadd groupdel groupmod shadow \
      useradd usermod userdel; do
    install -Dm644 "$srcdir/defaults.pam" "$pkgdir/etc/pam.d/$file"
  done

  # lastlog log file creation
  install -Dm644 "$srcdir/lastlog.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lastlog.conf"

  # Remove evil/broken tools
  rm "$pkgdir"/usr/sbin/logoutd

  # Remove utilities provided by util-linux
  rm \
      "$pkgdir"/usr/bin/{login,su,chsh,chfn,sg,nologin} \
      "$pkgdir"/usr/sbin/{vipw,vigr}

  # but we keep newgrp, as sg is really an alias to it
  mv "$pkgdir"/usr/bin/{newgrp,sg}

  # ...and their many man pages
  find "$pkgdir"/usr/share/man \
      '(' -name 'chsh.1'    -o \
          -name 'chfn.1'    -o \
          -name 'su.1'      -o \
          -name 'logoutd.8' -o \
          -name 'login.1'   -o \
          -name 'nologin.8' -o \
          -name 'vipw.8'    -o \
          -name 'vigr.8'    -o \
          -name 'newgrp.1' ')' \
      -delete
  rmdir \
      "$pkgdir"/usr/share/man/{fi,id,zh_TW}/man1 \
      "$pkgdir"/usr/share/man/{fi,ko/man8}

  # move everything else to /usr/bin, because this isn't handled by ./configure
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir/usr/sbin"
}
