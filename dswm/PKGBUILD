pkgname=dswm
pkgver=0.1
pkgrel=1
pkgdesc="Deep Space Window Manager - tiling window manager, oriented for good usability and good emacs integration (StumpWM-based)."
url="http://sourceforge.net/projects/dswm/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('sbcl' 'clx-git' 'cl-ppcre')
optdepends=('emacs')
makedepends=('autoconf')
conflicts=()
replaces=()
backup=()
install='dswm.install'
options=(!strip)
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz" "http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-modules.tar.gz")
md5sums=('2e2415acb0e4d0884b49dfc53800973c' '9affe88a79160df60635ba7928ae2224')

build() {
  mkdir -p "${pkgdir}"/usr/share/xsessions/ # patch for specific original makefile
  cd $startdir/src/$pkgname-$pkgver/src
  # sed -i 's/\@prefix\@//g' dswm.lisp.in
  autoconf
  ./configure --prefix=/usr \
  	      --with-lisp=sbcl \
	      --with-lisp-extra-options="--eval '(require :asdf)' --eval \"(pushnew #p\\\"/usr/share/common-lisp/systems/\\\" asdf:*central-registry* :test #'equal)\""
	      ## --with-lisp-extra-options="--eval '(require :asdf)' --load /usr/share/common-lisp/source/cl-ppcre/cl-ppcre.asd --load /usr/share/common-lisp/source/clx/clx.asd"

# this is necesary since the AUR packages do not modify the asdf's registry by default
      _sbcl_bopt="sbcl_BUILDOPTS=--eval \"(require :asdf)\" \
--eval \"(pushnew #p\\\"/usr/share/common-lisp/systems/\\\" asdf:*central-registry* :test #'equal)\" \
--eval \"(asdf:operate 'asdf:load-op 'clx)\" \
--load ./make-image.lisp"
      _sbcl_iopt="sbcl_INFOOPTS=--eval \"(require 'asdf)\" \
--eval \"(pushnew #p\\\"/usr/share/common-lisp/systems/\\\" asdf:*central-registry* :test #'equal)\" \
--eval \"(asdf:operate 'asdf:load-op 'clx)\" \
--eval \"(require 'dswm)\" \
--load ./manual.lisp \
--eval \"(progn (dswm::generate-manual) (sb-ext:quit))\""

  make # "$_sbcl_bopt" "$_sbcl_iopt"
  make DESTDIR="${pkgdir}" install
  cp -r $startdir/src/modules/ ${pkgdir}/usr/share/${pkgname}/
}
