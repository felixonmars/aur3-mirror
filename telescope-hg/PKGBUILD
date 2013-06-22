# Mantainer: Diego Principe <cdprincipe@at@gmail@dot@com>

_pkgname=telescope
pkgname=telescope-hg
pkgver=8.d19936144e38
pkgrel=1
pkgdesc="Telescope is an alternative task switcher, Exposé/Scale like, latest hg-pull" 
url="https://bitbucket.org/IlyaSkriblovsky/telescope"
arch=('i686' 'x86_64' 'arm')
license=('GPL')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'imlib2' 'libxft' 'dbus' 'glib')
makedepends=('pkgconfig' 'mercurial')
provides=('telescope')
conflicts=('telescope')
backup=('etc/telescope.conf' 'etc/telescope.keys')
source=('hg+http://bitbucket.org/IlyaSkriblovsky/telescope'
        'Makefile.patch')
md5sums=('SKIP'
         '00a731cad132fbc37a689fc11b50e38c')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd ${srcdir}/${_pkgname}
  patch -p0 < $startdir/Makefile.patch
  make 
}
package() {
  cd ${srcdir}/${_pkgname}
  mkdir -p $pkgdir/usr/bin
  mkdir $pkgdir/etc
  make PREFIX=$startdir/pkg/usr DESTDIR=${pkgdir} install 
}

