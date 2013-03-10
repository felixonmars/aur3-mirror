# Maintainer: Shingetsu Kurai <andrey.kudryavtsev@gmail.com>
pkgname=wicd-gtk-faenza
pkgver=1.7.2.4
pkgrel=1
pkgdesc="Theme for wicd based on nm-applet in faenza."
arch=(any)
url="http://maththias.deviantart.com/art/Faenza-Wicd-Iconset-183102684"
license=('unknown: base package is GPL2')
groups=()
depends=(wicd)
options=(emptydirs)
provides=(wicd-gtk)
conflicts=(wicd-gtk)
makedepends=(unzip python2 python2-babel python2-distribute gettext)
install=wicd.install
optdepends=('gksu: needed to access some preferences in gtk interface'
            'notification-daemon: needed if you want notifications'
	    'python2-notify:  needed if you want notifications')
source=(http://www.deviantart.com/download/183102684/faenza_wicd_iconset_by_maththias-d310ixo.zip
	http://launchpad.net/wicd/1.7/$pkgver/+download/wicd-$pkgver.tar.gz             wicd-daemon
        wicd.desktop
        dbus_string_fix.patch
        http://bazaar.launchpad.net/~wicd-devel/wicd/experimental/diff/831
        http://bazaar.launchpad.net/~wicd-devel/wicd/experimental/diff/835)
noextract=(faenza_wicd_iconset_by_maththias-d310ixo.zip)
md5sums=('80f1430472737af2b3a6593157f0f52e'
	 'c2435ddfdef0b9898852d72a85a45f0f'
	 'f40e5f59998d0829707a7c9976afa8f8'
	 '326df163a5732d38741371baa4fce9e5'
	 '744b3c12fe901ed435351e884dc8cb1d'
	 '0d2355bc2eb7234a537f42f1773edfe0'
         '1630d7fe8f09911302d33b26286ff9b8')
build() {
  mv "$srcdir/wicd-$pkgver" "$srcdir/$pkgbase-$pkgver"
  cd "$srcdir/$pkgbase-$pkgver"

  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
  export PYTHON=python2

  patch -p0 < "$srcdir/dbus_string_fix.patch"

  # Fix problem with new urwid FS#33378 LP#1075399
  patch -Np0 -i "$srcdir/831"
  patch -Np0 -i "$srcdir/835"


  python2 setup.py configure --no-install-init \
                             --resume=/usr/share/wicd/scripts/ \
                             --suspend=/usr/share/wicd/scripts/ \
                             --verbose \
                             --python=/usr/bin/python2 \
                             --lib=/usr/lib \
                             --systemd=/usr/lib/systemd/system

  #HACK for https://bugs.launchpad.net/wicd/+bug/928589 - removing because failed to run
  mkdir -p translations/ast/LC_MESSAGES
  msgfmt po/ast.po -o translations/ast/LC_MESSAGES/wicd.mo

  mv $srcdir/faenza_wicd_iconset_by_maththias-d310ixo.zip $srcdir/pkg.zip
  unzip $srcdir/pkg.zip
}

package() {
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install --optimize=1 --root="$pkgdir"

  install -Dm644 "$srcdir/wicd.desktop" "$pkgdir/usr/share/applications/wicd.desktop"

  cd build/lib/wicd
  for i in *.py; do
    install -Dm 755 $i "$pkgdir"/usr/lib/wicd/$i
  done

  #deleting the core dirs which exists in wicd
  rm -rf "$pkgdir"/etc/{wicd,dbus-1,rc.d,logrotate.d}
  rm -rf "$pkgdir"/usr/{lib,sbin}
  rm -rf "$pkgdir"/usr/share/{man,doc,locale,wicd/curses,wicd/daemon,wicd/backends,wicd/scripts,wicd/cli}
  rm -rf "$pkgdir"/var
  rm -f "$pkgdir"/usr/bin/{wicd-curses,wicd-cli}

  rm -rf "$pkgdir"/usr/share/autostart
  rm -rf "$pkgdir"/lib/
  rm -rf "$pkgdir"/usr/share/dbus-1

  rm "$pkgdir"/usr/share/pixmaps/wicd/*
  cp $srcdir/$pkgbase-$pkgver/Faenza\ Wicd\ Icons/dark/24/* $pkgdir/usr/share/pixmaps/wicd
}
