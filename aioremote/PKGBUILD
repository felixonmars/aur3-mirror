pkgname=aioremote
pkgver=3.4.2
pkgrel=2
pkgdesc="AIO Remote stands for All In One Remote, With All In One remote, you can control any application ever by creating your own fully customized custom remotes. You can use your Android/Blackberry phone/tablet. Windows, Linux and Mac are supported"
arch=(any)
license=('custom')
url="http://www.minecraft.net/"
depends=('java-runtime')
source=("http://goo.gl/VwW0L"
		'aioremote.desktop'
		'aioremote')
md5sums=('7b1c5e6d631421e6ce1bf0141d8888cb'
		'aa33d9134210eefac12574d0d032b693'
		'c14179731d91829997f92b168412cb1f')

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/aioremote"         "${pkgdir}/usr/bin/aioremote"
    #install -D -m644 "${srcdir}/AioServer3.4.2_lib/*"     "${pkgdir}/usr/share/aioremote/AioServer3.4.2_lib/"
    cd "${srcdir}"
    find "./AioServer3.4.2_lib/" -type f -exec install -D -m644 {,${pkgdir}/usr/share/aioremote/}{} \;
    install -D -m644 "${srcdir}/AioServer3.4.2.jar"     "${pkgdir}/usr/share/aioremote/AioServer3.4.2.jar"
    install -D -m644 "${srcdir}/config.ini"     "${pkgdir}/usr/share/aioremote/config.ini"
    install -D -m644 "${srcdir}/aioremote.desktop" "${pkgdir}/usr/share/applications/aioremote.desktop"
}

# vim:set ts=4 sw=4 et:

