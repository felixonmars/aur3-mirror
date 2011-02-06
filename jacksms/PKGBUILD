pkgname=jacksms
_corever=1.14
_ticppver=2.5.3
pkgver=1.2
pkgrel=2
pkgdesc="JackSMS is a software that sends SMS and MMS through internet"
url="http://jacksms.it/"
license=('other')
arch=('i686' 'x86_64')
depends=('qt' 'curl' 'p7zip' 'gtk2')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=amd64

source=(http://download.opensuse.org/repositories/home:/grisson/xUbuntu_10.04/${_arch}/${pkgname}_${pkgver}_${_arch}.deb
http://download.opensuse.org/repositories/home:/grisson/xUbuntu_10.04/${_arch}/jacksmscore_${_corever}_${_arch}.deb
http://download.opensuse.org/repositories/home:/grisson/xUbuntu_10.04/${_arch}/libticpp-dev_${_ticppver}_${_arch}.deb)


md5sums=('c42a42f57957ec0e4cfffff8307120bd'
         '1aa82913c826df8f913ea9d7b4bb65d7'
         '72d8d584a184f23c8b8c79ed951bedb4')


[ "$CARCH" = "x86_64" ] && md5sums=('9794e431b4dc742aeab501e59d48a8bc' '9f1ea0bab2c2b1db4e6d38d2090c8c29' 
'86e3cb821830c8694c651ec8d61b269a')

build() {
    ar vx  ${pkgname}_${pkgver}_${_arch}.deb
    tar xvzf data.tar.gz
    rm data.tar.gz 
    rm control.tar.gz

    ar vx  jacksmscore_${_corever}_${_arch}.deb
    tar xvzf data.tar.gz
    rm data.tar.gz 
    rm control.tar.gz

    ar vx  libticpp-dev_${_ticppver}_${_arch}.deb
    tar xvzf data.tar.gz
    rm data.tar.gz 
    rm control.tar.gz

    install -Dm 755 $srcdir/usr/bin/JackSms $pkgdir/usr/bin/JackSms
    install -Dm 755 $srcdir/usr/bin/QtJackSMS $pkgdir/usr/bin/QtJackSMS

    install -Dm 755 $srcdir/usr/lib/libticpp.a $pkgdir/usr/lib/libticpp.a
    
    install -Dm 755 $srcdir/usr/share/applications/jacksms.desktop \
        $pkgdir/usr/share/applications/jacksms.desktop
    install -Dm 755 $srcdir/usr/share/pixmaps/jacksms.png \
        $pkgdir/usr/share/pixmaps/jacksms.png
}
