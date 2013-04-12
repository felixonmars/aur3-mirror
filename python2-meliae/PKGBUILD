# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=python2-meliae
pkgver=0.4.0
pkgver_trimmed=0.4
pkgrel=2
pkgdesc="Meliae is a library meant to help people understand how their memory is being used in Python"
arch=('i686' 'x86_64')
url="https://launchpad.net/meliae"
license=('GPL3')
depends=('python2')
makedepends=('cython2')
source=(http://launchpad.net/meliae/trunk/${pkgver_trimmed}/+download/meliae-${pkgver}.tar.gz)
md5sums=('c704f4a314927fe96919018f67b2d3f3')

package() {
    cd ${startdir}/src/meliae-${pkgver}
    python2 ./setup.py install --root=${pkgdir}/ --optimize=1

    mv ${pkgdir}/usr/bin/strip_duplicates.py  ${pkgdir}/usr/bin/meliae-strip_duplicates.py
    cp ${startdir}/src/meliae-${pkgver}/remove_expensive_references.py ${pkgdir}/usr/bin/meliae-remove_expensive_references.py
    cp ${startdir}/src/meliae-${pkgver}/track_memory.py ${pkgdir}/usr/bin/meliae-track_memory.py
    chmod 755 ${pkgdir}/usr/bin/*
    sed -i -e 's,^#!/usr/bin.*,#!/usr/bin/env python2,' ${pkgdir}/usr/bin/*
    for file in ${pkgdir}/usr/bin/*
    do
        grep -q '#!/usr/bin/env python2' $file || sed -i '1i#!/usr/bin/env python2' $file
    done
}

# vim:set ts=4 sw=4 et:
