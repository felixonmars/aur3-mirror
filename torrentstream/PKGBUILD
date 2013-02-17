# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=torrentstream
pkgver=1.0.6
pkgrel=2
pkgdesc="TS multimedia engine and player based on VLC"
arch=('i686' 'x86_64')
url="http://torrentstream.org"
license=('nonfree')
provides=('torrentstream-engine' 'torrentstream-player-data' 'torrentstream-player' 'torrentstream-mozilla-plugin')
if [ "${CARCH}" = "x86_64" ]; then
    _arch="amd64"
    sha512sums=('8cb2e71e0e4dac9d5747ffd05091ab3719d53b7a7923e3a7b74a2ae1dc9e66b2fb35c4b79b11f9ecf41b7d2d925da89d0fd416b3a006ad1a80361631e85d2b48')
else
    _arch="i386"
    sha512sums=('e699351728d1ffa1a08401d3d2fc8d4bc8ae76272e5d0582bbbb1619ecec53534a3555a5ee055d5a91b59e85eef7b805ce814380cb926035766f2f292cab9caa')
fi 

source=("http://torrentstream.org/downloads/linux/test/${pkgname}_${pkgver}-0ubuntu8_${_arch}.deb")
#options=('!strip')
package() {
    cd $srcdir
    ar x "${pkgname}_${pkgver}-0ubuntu8_${_arch}.deb"
    tar -C ${pkgdir} -xvf data.tar.gz
    mv ${pkgdir}/usr/lib/python2.7/dist-packages/tsengine ${pkgdir}/usr/lib/python2.7/site-packages/
    rm -r ${pkgdir}/usr/lib/python2.7/dist-packages
    sed -i '7s/python/python2/g' ${pkgdir}/usr/bin/tsengine
}

# vim:set ts=4 sw=4 et:
