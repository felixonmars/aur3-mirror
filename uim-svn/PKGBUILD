# Contributor: noonov <noonov@gmail.com>

pkgname=uim-svn
pkgver=7466
pkgrel=2
pkgdesc="A multilingual input method framework"
arch=('i686' 'x86_64')
url="http://code.google.com/p/uim/"
license=('BSD')
depends=('gtk2')
makedepends=('subversion' 'intltool' 'perl' 'ruby' 'librsvg' 'asciidoc' 'ed')
provides=('uim')
conflicts=('uim')
options=('!libtool' '!docs' '!emptydirs')
install=uim-svn.install
source=()
md5sums=()

_svntrunk="http://uim.googlecode.com/svn/trunk"
_svnmod="uim"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build

  cd ${srcdir}/${_svnmod}-build

  ./make-wc.sh --prefix=/usr --libexecdir=/usr/lib/uim
  make
}

package() {
  cd ${srcdir}/${_svnmod}-build

  make -j1 DESTDIR=${pkgdir} install

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
