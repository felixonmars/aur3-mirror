# Contributor: cmorlok <christianmorlok@web.de>
# Contributor: fazibear <fazibear@gmail.com>
# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>
# Contributor: Gordin <9ordin @t gmail.com>

pkgname=nautilus2-dropbox
pkgver=0.6.8
pkgrel=1
pkgdesc="Dropbox for Linux - Nautilus extension and Command Line Interface"
arch=('i686' 'x86_64')
url="http://forums.dropbox.com/topic.php?id=21111"
license=('custom')
makedepends=('docutils')
depends=('gtk2' 'libnotify' 'nautilus2' 'dropbox' 'pygtk' 'python2')
install=nautilus-dropbox.install
source=("https://www.dropbox.com/download?dl=packages/nautilus-dropbox-${pkgver}.tar.bz2")
md5sums=('94d68f74ed2ef0c1f998aeb45af03caf')
build() {
  cd "$srcdir/nautilus-dropbox-${pkgver}/"

  sed -i "s/| python/|python2/" configure.in
  sed -i "s/\[python\]/[python2]/" configure.in

  sed -i "s/| python/|python2/" configure
  sed -i "s/set dummy python/set dummy python2/" configure
  sed -i 's|$(top_builddir)/libtool|libtool|' configure

  sed -i 's|$(top_builddir)/libtool|libtool|' aclocal.m4
  sed -i "s|/usr/bin/python|/usr/bin/python2|" dropbox.in
  sed -i "s|env python|env python2|" rst2man.py
  sed -i 's|python |python2 |' Makefile.am
  sed -i 's|python |python2 |' Makefile.in

  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make install DESTDIR=$pkgdir || return 1
  rm $pkgdir/usr/bin/dropbox
  rm $pkgdir/usr/share/applications/dropbox.desktop
  rmdir $pkgdir/usr/share/applications
}
