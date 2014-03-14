# Maintainer: Tim Cooper <tim.cooper@layeh.com>

pkgname='tcpcatcher'
pkgver='2.29.0'
pkgrel='1'
pkgdesc='A TCP, SOCKS, HTTP and HTTPS proxy monitor server software.'
arch=('i686' 'x86_64')

url='http://www.tcpcatcher.org/'
license=('custom')

depends=('java-runtime=7')

source=(http://www.tcpcatcher.org/TcpCatcher.jar
    tcpcatcher.sh
    LICENSE)
noextract=(TcpCatcher.jar)

sha256sums=(2210c0c1f4748000d8b5b9628b47258ca06c06177623297cfe9608fcebff863f
    4082ccb9223cc64c9210692aa85ec964d71d8524bfeacaa6d4e12d58b41ed6f1
    9c7740360de501d70acfbbb27a6757218c42b3f1cc7d52862a6ce74a342cc43c)

function build ()
{
    true
}

function package()
{
    install -D tcpcatcher.sh ${pkgdir}/usr/bin/tcpcatcher
    install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm0644 TcpCatcher.jar ${pkgdir}/usr/share/tcpcatcher/TcpCatcher.jar
}
