# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: nifan <carlos@nifan.tk>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gdesklets
pkgver=0.36.3
pkgrel=3
pkgdesc="A system for bringing mini programs (desklets) onto your desktop, where they are sitting there in a symbiotic relationship of eye candy and usefulness"
arch=('i686' 'x86_64')
url="http://gdesklets.de/"
license=('GPL') 
depends=('libgtop>=2.10.0' 'librsvg>=2.8.0' 'pygtk' 'desktop-file-utils' 'shared-mime-info' 'gnome-icon-theme' 'xdg-utils')
makedepends=('gnome-python>=2.12.0' 'intltool')
optdepends=('python2-bonobo: may required for some 3rd party desklets'
            'libappindicator: Application Indicator support')
options=(!libtool)
install=$pkgname.install
source=(http://gdesklets.de/files/$pkgname-$pkgver.tar.bz2
        gdesklets-core-0.36.3-.in-files.patch
        fix-vfs.patch
        make-gconf-optional.patch
        indicator.patch)
md5sums=('60c0c4e7301b3e653702b6fe5bf7e698'
         '27839bbefc2f6664ff31cff2d48dfeed'
         'dca6f468bc561b82d9194de4ebcd5e36'
         '45e81dd0fb20157bb840d006c3a4e2ea'
         '8590549639bda6167a8bc7cad852c2bf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/gdesklets-core-0.36.3-.in-files.patch"
  patch -Np1 -i "$srcdir/fix-vfs.patch"
  patch -Np1 -i "$srcdir/make-gconf-optional.patch"
  patch -Np1 -i "$srcdir/indicator.patch"
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  sed -i 's/python -c/$PYTHON -c/' configure.ac
  sed -i 's/python/python2/' shell/plugins/PackageInstaller/__init__.py

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
