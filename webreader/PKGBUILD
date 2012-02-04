# Contributor: Wido <widowild [at] myopera [dot] com>

pkgname=webreader
_buildver=0.8.80
buildver=0_8_80
_release=beta
pkgver=${_buildver}_${_release}
pkgrel=1
pkgdesc="it'is the most popular cross platform rss reader and is a full featured Google reader desktop client."
arch=('any')
url="http://www.getwebreader.com"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://www.getwebreader.com/app/air/download/WebReader_${buildver}.zip 'webreader.desktop' 'webreader.sh')

build()
{
   cd ${srcdir}/
   true
}

package()
{
    cd ${srcdir}/

   install -m644 -D ${srcdir}/WebReader_${buildver}/WebReader_${buildver}.air \
       ${startdir}/pkg/opt/$pkgname/$pkgname.air

   unzip -x ${srcdir}/WebReader_${buildver}/WebReader_${buildver}.air

   install -m644 -D ${srcdir}/assets/img/app/web_reader_128.png \
        ${startdir}/pkg/usr/share/pixmaps/$pkgname.png

   install -m755 -D ${srcdir}/$pkgname.sh \
       ${startdir}/pkg/usr/bin/$pkgname

   install -m644 -D ${srcdir}/$pkgname.desktop \
       ${startdir}/pkg/usr/share/applications/$pkgname.desktop
}

md5sums=('00911394014dd0e7268b0ead58ef7ce7'
         '310dac40980bf130c70ae2be7766e0d9'
         '2523a59173c48bcb742318364fe8d88d')
