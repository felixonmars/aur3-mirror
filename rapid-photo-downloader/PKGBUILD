# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Marc Moody <marc.r.moody at gmail dot com>
# Contributor: Dinh Bowman <dinh at vagueindustries dot com>

pkgname=rapid-photo-downloader
pkgver=0.4.8
pkgrel=1
pkgdesc="Application for downloading photos from multiple cameras, memory cards, and portable storage devices simultaneously"
arch=('any')
url="http://www.damonlynch.net/rapid/"
license=('GPL3')
depends=('python2' 'gnome-python' 'python2-notify' 'pygtk' 'python2-rsvg' 'python2-imaging' 'python2-exiv2' 'python2-gconf' 'dbus-python' 'perl-image-exiftool')
optdepends=('hachoir-metadata: Enable video downloading'
            'kaa-metadata: Enable video downloading'
            'hachoir-parser: Enable video downloading'
            'ffmpegthumbnailer: Enable video thumbnails')
source=(http://launchpad.net/rapid/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d9f1c1204a4a472e8a23bdb560b27e663d2b06425fa7403c889c853c8d7e921c')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  python2 setup.py install --root=${pkgdir}
}
