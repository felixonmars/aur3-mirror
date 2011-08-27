# Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
pkgname=brother-hl2070n
pkgver=2.0.1
pkgrel=3
pkgdesc="Brother HL-2070N CUPS driver"
arch=('i686' 'x86_64')
url="http://www.brother.com"
license=('custom:Brother Industries')
depends=('a2ps')
makedepends=('rpmextract')
install=$pkgname.install
source=($pkgname.patch
        http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperHL2070N-$pkgver-1.i386.rpm
        http://pub.brother.com/pub/com/bsc/linux/dlf/brhl2070nlpr-$pkgver-1.i386.rpm)
md5sums=('230871479ded69663fb5744b93869c33'
         '39e454e7c99996d5c5e46e51402b4169'
         'd404bbf08cd2a74923eb3ac9fae99fde')

if [[ -z "$CARCH" ]]; then
  echo ":: PKGBUILD could not detect your architecture. Some dependencies may be missing"
else
  if [[ "$CARCH" == "x86_64" ]]; then
    depends=('lib32-glibc')
  fi
fi

build() {
    cd "$srcdir" || return 1
    for n in *.rpm; do
        rpmextract.sh "$n" || return 1
    done

    cd "$srcdir/usr/" || return 1
    patch -p1 < ../$pkgname.patch

    cd "$srcdir" || return 1
    "$srcdir/usr/local/Brother/cupswrapper/cupswrapperHL2070N-2.0.1"

    mkdir -p "$pkgdir/usr/share"
    cp -R "$srcdir/usr/bin" "$pkgdir/usr"
    cp -R "$srcdir/usr/lib" "$pkgdir/usr"
    cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

    rm "$pkgdir/usr/share/brother/cupswrapper/cupswrapperHL2070N-2.0.1"
    rm "$pkgdir/usr/share/brother/inf/setupPrintcap"

    install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/HL2070N.ppd"
    install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrapperHL2070N"
}
