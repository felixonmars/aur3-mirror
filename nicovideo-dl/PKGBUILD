# Maintainer: Jari Vetoniemi <mailroxas at gmail dot com>
# Contributor: smly <eowner at gmail dot com>

pkgname=nicovideo-dl
pkgver=0.0.20120212
pkgrel=2
pkgdesc="A small command-line program to download videos from nicovideo.jp"
arch=('any')
url="http://sourceforge.jp/projects/nicovideo-dl/"
license=('MIT')
depends=('python2')
source=("http://iij.dl.sourceforge.jp/nicovideo-dl/56304/$pkgname-$pkgver.tar.gz"
        "python-bug-11220.patch")

prepare()
{
   cd "${pkgname}-${pkgver}"
   patch -p0 < "${srcdir}/python-bug-11220.patch"
   sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgname}"
}

package()
{
   cd "${pkgname}-${pkgver}"
   install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

md5sums=('e6f4361ffdabb7b24f852833ec61f3c4'
         '5820592f4a1d9fe9f7d4aac36915ac89')

# vim: set ts=8 sw=3 tw=0 :
