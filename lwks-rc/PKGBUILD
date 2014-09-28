# Maintainer: Tom Kwok <contact@tomkwok.com>
# Contributor: stjhimy <stjhimy@gmail.com>
# Contributor: CYB3R <dima@golovin.in>
# Contributor: Sarkasper <kasper.menten@gmx.com>
# Contributor: Scias <shining.scias@gmail.com>
# Contributor: darzki <darzki@o2.pl>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="lwks-rc"
provides="lightworks"
pkgver=12.0
pkgrel=1
pkgdesc="Lightworks is a professional video editing suite"
arch=('x86_64')
url="http://www.lwks.com/"
license=('custom')
install="lwks.install"
depends=('gtk3' 'portaudio' 'libgl' 'glu' 'ffmpeg' 'ffmpeg-compat' 'libedit' 'libtiff4' 'libgsf' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
conflicts=('lwks-beta')
source=("http://www.lwks.com/dmpub/lwks-$pkgver-amd64.deb")
DLAGENTS="http::/usr/bin/curl --referer 'http://www.lwks.com/index.php?option=com_lwks&view=download&Itemid=206' -O %u"
sha256sums=('SKIP')

#Install package
package() {
tar -zxf data.tar.gz -C "${pkgdir}"
mv "${pkgdir}/lib/" "${pkgdir}/usr/lib/" 
gzip -d "${pkgdir}/usr/share/doc/lightworks/changelog.gz"

#Create and copy copyright
install -Dm644 "${pkgdir}/usr/share/doc/lightworks/copyright" \
"$pkgdir/usr/share/licenses/$pkgname/copyright"
rm "${pkgdir}/usr/share/doc/lightworks/copyright"

# Create folders
install -dm777 "${pkgdir}/usr/share/lightworks/{Preferences,Audio Mixes}"
}
