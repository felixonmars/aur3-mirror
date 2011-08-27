pkgname=jacksms-desktop
_corever=1.14
_ticppver=2.5.3
pkgver=2.0
pkgrel=4.2
pkgdesc="JackSMS is a software that sends SMS and MMS through internet"
url="http://jacksms.it/"
license=('other')
arch=('i686' 'x86_64')
depends=('qt' 'curl' 'p7zip' 'gtk2')
conflicts=('jacksms')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=amd64

source=(http://download.opensuse.org/repositories/home:/grisson/xUbuntu_10.10/${_arch}/${pkgname}_${pkgver}_${_arch}.deb
http://download.opensuse.org/repositories/home:/grisson/xUbuntu_10.10/${_arch}/libticpp-dev_${_ticppver}_${_arch}.deb)


md5sums=('35283d2fbc866cebcc4b14188efd0ff3'
         '452dd000b62eb028142c60831b5ffc67')

[ "$CARCH" = "x86_64" ] && md5sums=('483eb8bfb583306df55805e6c7f53c79'
         '15b89ca61d2e32f4c473d6552d52d99d')

build() {
    
    ar vx  ${pkgname}_${pkgver}_${_arch}.deb
    tar xvzf data.tar.gz
    rm data.tar.gz 
    rm control.tar.gz

    ar vx  libticpp-dev_${_ticppver}_${_arch}.deb
    tar xvzf data.tar.gz
    rm data.tar.gz 
    rm control.tar.gz

    cp -R usr $pkgdir


}
