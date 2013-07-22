# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>

pkgname=tor-autocircuit
pkgver=0.2
pkgrel=5
pkgdesc="Tor Autocircuit was developed to give users a finer control over Tor circuit creation. The tool exposes the functionality of TorCtl library which allows its users to control circuit length, speed, geolocation, and other parameters."

arch=('any')
license=('custom')
url="http://www.thesprawl.org/projects/${pkgname}"

depends=('tor' 'python2-pytorctl-git' 'python2-sqlalchemy-0.7.9' 'python2-elixir' 'python2-geoip')
source=("http://www.thesprawl.org/media/projects/${pkgname}-${pkgver}.tar.gz")
md5sums=('a84cb021b1d67976380a319f5863fca5')


package() {
    cd ${srcdir}/${pkgname}

    sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' ${pkgname}.py

    install -d ${pkgdir}/usr/bin
    install -Dm0755 ${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}
