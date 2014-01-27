# Contributor: foobster <esangaline@gmail.com>

pkgname=lyx-git
pkgver=20140126
pkgrel=1
pkgdesc="An advanced open-source document processor."
arch=(i686 x86_64)
url='http://www.lyx.org'
conflicts=('lyx')
depends=('qt4' 'texlive-core' 'python2' 'perl' 'imagemagick' 'aspell' 'aiksaurus' 'boost')
optdepends=('texlive-latex3: pdf export')
makedepends=('bc' 'cmake' 'git' 'automake')
license=('GPL')
source=('lyx.desktop' 'lyx.png')
md5sums=('c11db315dc99254a4118827f98922623'
         'fcbfb9c9d4716f69ae8c64cf13e9a6fb')

gitrepo=git://git.lyx.org/lyx

prepare() {
  git clone $gitrepo
}

pkgver() {
    git ls-remote --tags git://git.lyx.org/lyx |tail -n1| cut -d/ -f3| cut -d^ -f1
}

build() {
  export PYTHON=python2
  cd lyx
    ./autogen.sh
    ./configure --prefix=/usr \
    --with-frontend=qt4 --enable-build-type=release
  make -j 4 || return 1
  make -j 4 DESTDIR=${pkgdir} install || return 1

  # install desktop entry
  install -Dm644 ${srcdir}/lyx.desktop \
	${pkgdir}/usr/share/applications/lyx.desktop || return 1
  cp ${srcdir}/lyx.png ${pkgdir}/usr/share/lyx/images/lyx.png
}
