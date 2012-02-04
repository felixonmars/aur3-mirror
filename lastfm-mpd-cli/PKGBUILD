# Maintainer: morendi <kracette at gmail dot com>

pkgname=lastfm-mpd-cli
pkgver=0.02
pkgrel=2
pkgdesc="A simple command-line utility for interfacing with MPD and Last.fm"
arch=(any)
url="http://morendi.github.com/lastfm-mpd-cli/"
license=('GPL')
depends=('python2' 'pylast' 'mpc' 'baker')
source=(http://morendi.github.com/lastfm-mpd-cli/$pkgname-$pkgver.tar.gz)
md5sums=('275349b33195e053f4bc63fc3ac187e2')

build() {
    cd "${srcdir}"
    # Have it use python2
    sed 's|#!/usr/bin/python|#!/usr/bin/env python2|g' -i ${pkgname}.py
    install -Dm755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.rc" "${pkgdir}/etc/${pkgname}.rc"
}


