# Contributor: Madek <gonzaloseguel@gmail.com>
# Contributor: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=pidgin-libnotify-ubuntu
realname=pidgin-libnotify
pkgver=0.14
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Patched pidgin-libnotify version for notify-osd and indicators"
url="http://gaim-libnotify.sourceforge.net/"
license=('GPL')
depends=('pidgin' 'libnotify' 'perlxml' 'gettext' 'libindicate')
makedepends=('libtool' 'intltool')
replaces=('gaim-libnotify')
conflicts=('pidgin-libnotify')
provides=('pidgin-libnotify')
source=(http://downloads.sourceforge.net/sourceforge/gaim-libnotify/${realname}-${pkgver}.tar.gz
http://archive.ubuntu.com/ubuntu/pool/main/p/${realname}/${realname}_${pkgver}-4ubuntu1.debian.tar.gz
updatefrpo.patch)
md5sums=('bfb5368b69c02d429b2b17c00a6673c0'
         '613b91f80a8d09a0dc324cdc1ea52c11'
	 'aaea6a9a16f08648a876a5d4b939fa3b')

build() {
  cd $srcdir/
  patch -p0 < debian/patches/de_po.diff || return 1
  patch -p0 < debian/patches/indicate.patch || return 1
  patch -p0 < debian/patches/indicate-autotools.patch || return 1
  patch -p0 < debian/patches/force-load.patch || return 1
  patch -p0 < debian/patches/it_po.diff || return 1
  patch -p0 < ../updatefrpo.patch || return 1
  cd ${realname}-${pkgver}
  ./configure --prefix=/usr --disable-deprecated
  make || return 1
  make DESTDIR=${pkgdir} install
}
