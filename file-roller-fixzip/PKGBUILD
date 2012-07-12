# Maintainer: Nohappiness <nohappiness@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=file-roller-fixzip
_pkgname=file-roller
pkgver=3.4.2
pkgrel=1
pkgdesc="For simplified chinese user, Archive manipulator for GNOME, no garbled zipfiles."
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'dconf')
makedepends=('intltool' 'gnome-doc-utils' 'pkg-config' 'nautilus' 'libsm')
optdepends=('unrar: the RAR uncompression program'
            'zip: creates PKZIP-compatible .zip files'
            'unzip: unpacks .zip archives'
            'p7zip-fixzip: 7zip compression utility'
            'xz: managing LZMA and XZ compressed files'
            'arj: ARJ archiver'
            'unace: extraction tool for the proprietary ace archive format')
provides=('file-roller')
conflicts=('file-roller')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
install=file-roller.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz
        30_exchange-7z-7za.patch)
sha256sums=('7085a351c55171718bbf5b9b614a7b9606efb8cbd2eb44cc6c538545444d0cdd'
            '4f0db44f544ed450da5070cbb838c508a08da607108b2652a7fb3d111af824fa')

build() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../30_exchange-7z-7za.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/file-roller \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
