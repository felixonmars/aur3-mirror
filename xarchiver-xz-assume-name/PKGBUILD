# Maintainer: Ivan Puntiy <ivan.puntiy at gmail>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xarchiver-xz-assume-name
pkgver=0.5.2
pkgrel=2
pkgdesc="GTK+ frontend to various command line archivers with a sensible default archive name in batch mode, with xz support patch"
arch=('i686' 'x86_64')
url="http://xarchiver.sourceforge.net"
license=('GPL')
groups=('xfce4-goodies')
depends=('gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('')
optdepends=('tar: TAR support'
            'gzip: GZIP support'
            'bzip2: BZIP2 support'
            'zip: ZIP support'
            'unzip: ZIP support'
            'unrar: RAR support'
            'p7zip: 7z support'
            'arj: ARJ support'
            'lha: LHA support'
            'lzma-utils: LZMA support'
            'lzop: LZOP support')
provides=("xarchiver=$pkgver")
conflicts=('xarchiver' 'xarchiver-xz' 'xarchiver-assume-name' 'xarchiver-svn')
options=('!libtool')
install=xarchiver.install
source=(http://downloads.sourceforge.net/xarchiver/xarchiver-$pkgver.tar.bz2
        # rpm2cpio.patch by Daniel Hokka Zakrisson
        # taken from https://bugzilla.redhat.com/show_bug.cgi?id=577480
        # sent upstream through
        # https://sourceforge.net/tracker/?func=detail&aid=3310768&group_id=140153&atid=745602
        xarchiver-0.5.2-rpm2cpio.patch
        # segfault-open-with.patch by Bastiaan Jacques
        # taken from https://bugzilla.redhat.com/show_bug.cgi?id=690012
        # sent upstream through
        # https://sourceforge.net/tracker/?func=detail&aid=3310778&group_id=140153&atid=745600
        xarchiver-0.5.2-segfault-open-with.patch
        # fix-7z-support.patch by taken from
        # https://sourceforge.net/tracker/?func=detail&aid=3137589&group_id=140153&atid=745602
        xarchiver-0.5.2-fix_7z_support.patch
        xarchiver-$pkgver-add_xz_support.patch
	xarchiver-$pkgver-xz-extract.patch
	assume_name.patch
	explicit_extension.patch)
md5sums=('2bc7f06403cc6582dd4a8029ec9d038d'
         'd4a1accdbba2b50e5707097dd3548d7a'
         'f9036a44157b318cbc59ed012b04974b'
         '782f55c1f1021dc02c7739bf8a47336e'
         '9facca6efd1c0760ce2072ea458c51cb'
         'b5e3417ba748387b939a114899991692'
	 '29e468d9ad60d078b8670eac2177a5e7'
	 '2ca70379a37f1614565366ac3f757b8e')

build() {
  cd "$srcdir/xarchiver-$pkgver"
  #patches taken from: http://pkgs.fedoraproject.org/gitweb/?p=xarchiver.git
  patch -Np1 -i ../xarchiver-0.5.2-rpm2cpio.patch
  patch -Np1 -i ../xarchiver-0.5.2-segfault-open-with.patch
  patch -Np1 -i ../xarchiver-0.5.2-fix_7z_support.patch

  # Slakware's XZ support patch
  patch -uNp1 -i ../xarchiver-$pkgver-add_xz_support.patch
  # ... and extraction support (missing in slak patch)
  patch -uNp1 -i ../xarchiver-$pkgver-xz-extract.patch

  cd src
  patch -p0 -i $srcdir/assume_name.patch
  patch -p0 -i $srcdir/explicit_extension.patch
  cd ..

  ./configure --prefix=/usr --libexecdir=/usr/lib/xfce4
  make
}

package() {
  cd "$srcdir/xarchiver-$pkgver"
  make DESTDIR="$pkgdir" install
}
