# Maintainer: Vasil Yonkov <bustervill at fastmail dot fm>
pkgname=jhbuild-git_2
_gitname=jhbuild
pkgver=7224.00fd482
pkgrel=1
pkgdesc="A tool designed to ease building collections of source packages."
arch=('i686' 'x86_64')
url="https://live.gnome.org/Jhbuild"
license=('GPL')
depends=('python2')
makedepends=('automake-1.12'
             'rsync'
             'subversion'
             'git'
             'intltool'
             'gnome-doc-utils'
             'yelp-tools'
             'gnome-common-git')
optdepends=('docbook-xsl: required by jhbuild sanitycheck'
            'cvs: required by jhbuild sanitycheck')
provides=('jhbuild')
conflicts=('jhbuild' 'jhbuild-git')
install=jhbuild.install
source=('jhbuild::git://git.gnome.org/jhbuild'
        'use_python2_when_building_modules.patch')
md5sums=('SKIP'
         'ddce421e6f124887580c17b56de4069e')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  patch -p1 < "../use_python2_when_building_modules.patch"
  ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/jhbuild/"
  cp -dr modulesets "$pkgdir/usr/share/jhbuild/"
  sed -ir '1 s/python/python2/' "$pkgdir/usr/bin/jhbuild"
  install -d "$pkgdir/usr/lib/pkgconfig/"
  ln -sr "$pkgdir/usr/lib/pkgconfig/python-2.7.pc" "$pkgdir/usr/lib/pkgconfig/python.pc"
}

# vim:set ts=2 sw=2 et:
