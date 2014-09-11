# Maintainer: flow
# Contributor: flow

pkgname=wifiguard
pkgver=1.0.4
pkgrel=2
pkgdesc="an essential tool for everyone running a small WiFi network and striving to keep it secure"
arch=('i686' 'x86_64')
url="http://www.softperfect.com/products/wifiguard/"
license=('commercial')
depends=('pango' 'cairo' 'libpng' 'libstdc++5')

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    source=("http://www.softperfect.com/download/${pkgname}/${pkgname}_linux_${_arch}.tar.gz")
    md5sums=('bea0f94219ec3729de81e008e7aabc38')

elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    source=("http://www.softperfect.com/download/${pkgname}/${pkgname}_linux_${_arch}.tar.gz")
    md5sums=('926faefd2197b911212a2f36dd0eb27c')
    
fi

package() {
    install -d ${pkgdir}/usr/bin
    install -D -m755 ${srcdir}/WiFiGuard ${pkgdir}/usr/bin/wifiguard
}
