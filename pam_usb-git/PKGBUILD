# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=pam_usb-git
pkgver=20120515
pkgrel=1
pkgdesc="PAM modules that enables either two-factor or password-less authentication using an USB storage device (such as an USB flash memory stick)"
url="http://www.pamusb.org/"
license=("GPL")
depends=(libxml2 pam pmount udisks dbus-python pygobject)
arch=('i686' 'x86_64')
backup=('etc/pamusb.conf')
provides=(pam_usb)
conflicts=(pam_usb)

_gitroot=https://github.com/aluzzardi/pam_usb.git
_gitname=pam_usb

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
    else
    git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" PAM_USB_DEST="$pkgdir/usr/lib/security" install

    sed -i 1s/python/python2/ "$pkgdir/usr/bin/pamusb-"{agent,conf}
}
