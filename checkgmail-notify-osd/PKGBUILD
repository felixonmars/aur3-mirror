# Contributor: Mário Buči <mario dot buci at gmail dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>

pkgname=checkgmail-notify-osd
pkgver=1.13
pkgrel=2
pkgdesc="CheckGmail is Gmail notifier. This package comes with replaced notifications for new e-mails, now using notify-osd."
arch=('i686' 'x86_64')
url="http://checkgmail.sourceforge.net/"
license=('GPL')
depends=('gtk2-perl' 'perl-gtk2-trayicon' 'perl-libwww' 'perl-crypt-ssleay' 'perl-xml-simple' 'perlxml' 'perl-crypt-simple' 'notify-osd' 'libnotify')
provides=('checkgmail')
conflicts=('checkgmail')
install=
source=(http://prdownloads.sourceforge.net/checkgmail/checkgmail-${pkgver}.tar.bz2 \
        checkgmail.patch)
md5sums=('8f6742ba9c09f7b7b23a5be2e14708c7' \
         '6f2da07e0b5743751c9d901185bfa051')

build() {
    cd "$srcdir/checkgmail-$pkgver"
  
    patch < ../checkgmail.patch || return 1

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/man/man1
    install -m 755 checkgmail $pkgdir/usr/bin
    install -m 644 man/checkgmail.1.gz $pkgdir/usr/share/man/man1
}

