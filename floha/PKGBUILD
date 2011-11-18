# Maintainer: Hakim <acrox999 at gmail dot com>
pkgname=floha
pkgver=0.3
pkgrel=1
pkgdesc="A Qt frontend for FFMpeg to batch encode audios and videos."
arch=(any)
url="http://sumbu.org/node/839"
license=('OSL-3')
groups=('multimedia')
depends=('qt' 'ffmpeg')
source=('http://www.sumbu.org/sites/default/files/FlohaVer0.3.tar_.bz2' 'OSL3.0' 'floha.desktop' 'floha')
noextract=('FlohaVer0.3.tar_.bz2')
install=${pkgname}.install
options=(!strip)
md5sums=('7cba11c44a7dadcfbd5aec5231ecdf7a'
         '1d79f7ce4a1f6a2b352d40a9e8334cd2'
         '4f8328902b8d296ae86a62389d4037e8'
         '4e63017e3981e5dc5bed34bb6f0b09bc')

build() {
cd "${srcdir}"

# Create a new folder for source files to avoid conflicts.
mkdir "${srcdir}/${pkgname}-${pkgver}"

# Extract source tarball into the previously created folder.
tar -xf FlohaVer0.3.tar_.bz2 -C "${srcdir}/${pkgname}-${pkgver}"
cd "${srcdir}/${pkgname}-${pkgver}"

# Create a folder named 'license' in the previously created folder and copy the license file into this folder.
mkdir license
cp "${startdir}/OSL3.0" "${srcdir}/${pkgname}-${pkgver}/license/OSL3.0"
}

package() {
# Install the launcher script into '/usr/bin/'.
mkdir -p "${pkgdir}/usr/bin/"
cd "${startdir}"
install -Dm755 floha "${pkgdir}/usr/bin/"

# Install the license into '/usr/share/licenses/${pkgname}/'.
install -Dm644 OSL3.0 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# Install '${pkgname}.desktop' so that the application will be available in the application menu.
mkdir -p "${pkgdir}/usr/share/applications/"
install -Dm644 floha.desktop "${pkgdir}/usr/share/applications/"

# Copy the whole source folder into '/usr/share/'.
cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/"

# Rename the source folder from '${pkgname}-${pkgver}' to '${pkgname}'.
cd "${pkgdir}/usr/share/"
mv "${pkgname}-${pkgver}" "${pkgname}"
}