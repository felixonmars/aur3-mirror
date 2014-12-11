# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="nzbdrone"
pkgver="2.0.0.2341"
pkgrel=1
pkgdesc="PVR for newsgroup users"
arch=(any)
url="http://www.nzbdrone.com"
license=('GPL3')
depends=(mono libmediainfo sqlite)
optdepends=('sabnzbd: an NZB downloader'
            'nzbget: an NZB downloader')
install=${pkgname}.install
changelog=
source=("http://update.nzbdrone.com/v2/master/mono/NzbDrone.master.${pkgver}.mono.tar.gz"
        "nzbdrone.sh"
        "nzbdrone.service")
noextract=()
md5sums=('54d60420b1d497c50d3eabd28064c3a7'
         '3b61cab484404951eb5d2c0cf760da07'
         '0737b3a446856ab123c74c0aa842e2a5')
sha1sums=('cf86aa6fc859ea27d17c2d325ad52193bb5a0ede'
          '4bdfefd408e91760b10c6d24f03b53c1d9baba54'
          '7c1af3ec74f78a51a9ebda2830f9404bdb99be50')
sha256sums=('1b8120d73729a147c8c2fb31cdd0c6ec0e52de89ca289a775b2e3a2094b1d27a'
            '556056c6f65d2492748f0b02dd4d9c5f956c3c5eb8eacbf134e2c72f25310cd1'
            'a68dbacd20731970c7316cd8da682b2e3ee2cf27f9ad7609a39cd7bcfcea356e')
sha512sums=('1dbd18530d7b043501a706ed215034176d95b24a93df880c0273ceb61d830bd5d668665c4eec28fbba78af136e7049b3b2c2a5a3c8501daad27b79314ddc5c1d'
            'ae500efc264a46d2fffa95294ea4537cd07890b5df1cee63ed794be1cfc71d3a4e4f3ed6037893cdf0771d37d16748c56a5ada13183878582ec9dc7d768a8753'
            '637d66387cef305534d3a0a0d92fcf1377167f58cd1a4ec02577d26663ed3de36f9ebf1d8a9396e30dc527bc826833ad4ef8e18a4c3dba40226f5151e309ceb7')

package() {
    cd $srcdir

    msg2 "Install NzbDrone in /usr/lib"
    install -d -m 755 "${pkgdir}/usr/lib/NzbDrone"
    cp -dpr --no-preserve=ownership "${srcdir}/NzbDrone" "${pkgdir}/usr/lib"

    msg2 "Install executable into /usr/bin"
    install -D -m755 "${srcdir}/nzbdrone.sh" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Install nzbdrone.service"
    install -D -m 644 "${srcdir}/nzbdrone.service" "${pkgdir}/usr/lib/systemd/system/nzbdrone.service"
}
