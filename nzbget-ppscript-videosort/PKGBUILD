# Maintainer: Gilrain <pierre.buard+aur gmail com>

pkgname=nzbget-ppscript-videosort
pkgver=4.0
pkgrel=2
pkgdesc="Post-processing script to automatically organize downloaded video files."
arch=(any)
url="http://nzbget.sourceforge.net/VideoSort"
license=('GPL3')
depends=('nzbget')
changelog=changelog
source=("http://downloads.sourceforge.net/project/nzbget/ppscripts/videosort/videosort-ppscript-${pkgver}.zip")
sha1sums=('0e7c34061c595e7489176fff84255b0aba1ca762')

prepare() {
    sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' $(find ${srcdir} -name '*.py')
}

package() {
    install -dm755 ${pkgdir}/usr/share/nzbget/ppscripts
    cp -a ${srcdir}/videosort ${pkgdir}/usr/share/nzbget/ppscripts
}