# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=postfwd
pkgver=1.35
pkgrel=1
pkgdesc="Combines complex postfix restrictions in a ruleset similar to those of the most firewalls"
arch=(any)
url="http://postfwd.org/"
license=('bsd')
depends=('perl' 'perl-io-multiplex' 'perl-net-server' 'perl-net-dns')
source=("http://postfwd.org/$pkgname-$pkgver.tar.gz"
        "${pkgname}.service")
md5sums=('8e01328416c735d55efec90dede8bff2'
         'f61023db6763d1ca34e1faf2e3352e3e')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  sed -i bin/postfwd-script.sh \
      -e 's|PFWCMD=/usr/local/postfwd/sbin/postfwd|PFWCMD=/usr/bin/postfwd|g'
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -dm755 $pkgdir/{etc/$pkgname,usr/{bin,bin,share/{man,$pkgname}}}

  cp -ra etc/*    $pkgdir/etc/$pkgname/
  cp -ra -t $pkgdir/usr/bin/ bin/* sbin/*
  cp -ra man/*    $pkgdir/usr/share/man/
  cp -ra tools/*  $pkgdir/usr/share/$pkgname/
  cp -ra doc/*    $pkgdir/usr/share/$pkgname/

  install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service

  install -dm755 $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/usr/share/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
