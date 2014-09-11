# Maintainer : msx <archlinux.us: msx>
# Contributor: William A. Kennington III <william@wkennington.com>

pkgname=jailkit
pkgver=2.17
pkgrel=2
pkgdesc="Chroot jailing scripts"
arch=('i686' 'x86_64')
url="http://olivier.sessink.nl/jailkit/"
license=('GPL')
depends=('glibc' 'python2')
backup=(etc/jailkit/jk_{check,chrootsh,init,lsh,socketd,update}.ini)
install="$pkgname.install"
source=("http://olivier.sessink.nl/jailkit/$pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('e9a086a23731ad7aceb6a3c7fa0a6243d870f4bc6cdba7f46d4392fadb657880dd2a99bc24c40d467bacf5d472eee0532a3c5380ad9c4f8e46e61e02f14ae3e7'
            '5028f451d7183fba7b04a6b0b2714891d4d15e76f241a77a1f8caa3993ec58475ffc1e55a88836dbfa5279fa82ab1397cb5f035f37fccffa7dd7e4f9fdd2d058')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/jailkit \
    PYTHONINTERPRETER=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
