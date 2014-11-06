# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=subcommander
pkgver=2.0.0b5p2
pkgrel=1
pkgdesc='A Subversion repository management tool.'
arch=('i686' 'x86_64')
url='http://subcommander.tigris.org'
license=('GPL')
depends=('qt4' 'subversion' 'neon')
makedepends=('boost' 'gawk' 'gcc')
conflicts=('subcommander2-svn')
source=(http://subcommander.tigris.org/files/documents/1759/47637/Subcommander-$pkgver.tar.gz \
        $pkgname.desktop submerge.desktop \
        $pkgname-gcc-4.3.1.patch)

md5sums=('2f6ffcf711d9cbea74d0c1e8a0e675b7'
         'fd069590f3a7e4665d59774ecc84c621'
         '11e1813cdce32f1412c0f0728fb9b67a'
         'd872989b5fe1ed8ddc228d57dc625c79')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

#Qt3 required
#  . /etc/profile.d/qt3.sh
#  export PATH=$QTDIR/bin:$PATH

#  patch -Np0 -i "${srcdir}"/$pkgname-gcc-4.3.1.patch

  ./configure --prefix=/usr --enable-nls --with-qt=/usr/lib/qt4 #needs most probably older version of QT
  make 
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

#install icons and .desktop files
  install -D -m644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/submerge.desktop \
    "${pkgdir}"/usr/share/applications/submerge.desktop
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/pics/Logo_Icon_16x16.png \
    "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/$pkgname.png
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/pics/Logo_Icon_32x32.png \
    "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/$pkgname.png
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/pics/Logo_Icon_48x48.png \
    "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/$pkgname.png
}
