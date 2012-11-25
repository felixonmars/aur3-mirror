# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
pkgname=userstate
pkgver=0.1
pkgrel=1
pkgdesc="Display login-state of users and additional information about their session."
arch=('any')
url="https://github.com/open-dynaMIX/userstate"
license=('GPL')
depends=('whois')
source=("http://dynamix-tontechnik.ch/code/userstate/$pkgver/userstate.tar.gz")
noextract=("userstate.1.gz")
md5sums=('282f7da6c6d27c3f5c29e5e71e09ffa3')
build() {
    cd "$srcdir"
    install -d $pkgdir/usr/share/$pkgname
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/man/man1
    install -m644 -t $pkgdir/usr/share/$pkgname/ COPYING README
    install -m755 $pkgname $pkgdir/usr/share/$pkgname/
    install -m644 $pkgname.1.gz $pkgdir/usr/share/man/man1/
    ln -sf /usr/share/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
