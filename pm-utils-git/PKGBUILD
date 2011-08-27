# Maintainer: Martti Kühne <mysatyre at gmail dot com>

pkgname=pm-utils-git
pkgver=20100713
pkgrel=1
pkgdesc="Utilities and scripts for suspend and hibernate power management"
arch=('i686' 'x86_64')
url="http://pm-utils.freedesktop.org"
license=('GPL')
depends=('bash' 'procps' 'vbetool' 'pm-quirks')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
optdepends=('upower')
conflicts=(pm-utils)
provides=(pm-utils=1.4.1)
source=(11netcfg)
md5sums=('9839687c8787d99fd4ff36aa3238c27b')

_gitroot=git://anongit.freedesktop.org/git/pm-utils
_gitname=pm-utils

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # Copy Latest files to Build Directory
  cp -rf $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  # Configure Source
  ./autogen.sh --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var
  make
  make DESTDIR="${pkgdir}" install

  # install additional hooks
  install -m755 "${srcdir}/11netcfg" "${pkgdir}/usr/lib/pm-utils/sleep.d/"
}
