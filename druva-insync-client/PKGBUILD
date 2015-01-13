# Maintainer: Adam Delman <flyn [at] flyn [dot] cc>
pkgname=druva-insync-client
pkgver=5.4
pkgrel=0
_subver=27025
pkgdesc="Druva inSync-Client"
url='https://www.druva.com/'
arch=('x86_64')
license=('closed')
install='druva-insync.install'
_arch='_amd64'
options=("!strip")
source=("https://downloads.druva.com/downloads/inSync/Linux/${pkgver}/patch-1/inSync-Client-Installer-ver-${pkgver}-${_subver}${_arch}.deb" "inSync")
md5sums=('9f03fcecfb567e17929169d79d224c38' '0f0a5ef986c29187d67282c5002af4de')

build() {
       ar -xv inSync-Client-Installer-ver-${pkgver}-${_subver}${_arch}.deb || return 1
       tar -zxf data.tar.gz || return 1
       sed -i 's/Exec=inSync/Exec=\/opt\/Druva\/inSync\/bin\/inSync/g' ${srcdir}/opt/Druva/inSync/desktop/*.desktop
}

package() {
       mkdir -p "${pkgdir}"/opt/Druva/
       cp -r opt/Druva/* "${pkgdir}"/opt/Druva/
       rm -f ${srcdir}/opt/Druva/inSync/bin/inSync
       install -Dm755 ${srcdir}/inSync "${pkgdir}"/opt/Druva/inSync/bin/inSync
       install -Dm644 "$srcdir/opt/Druva/inSync/desktop/inSync.desktop" "$pkgdir/usr/share/applications/inSync.desktop"
}