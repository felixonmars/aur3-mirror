# $Id: PKGBUILD 51731 2009-09-10 17:23:57Z juergen $
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Daniel White <daniel@whitehouse.id.au>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=sbcl-with-debugger
pkgver=1.0.34
pkgrel=1
pkgdesc="Steel Bank Common Lisp with fixes to re-enable the debugger and compilation on x86_64."
arch=(i686 x86_64)
license=('custom')
depends=('glibc')
provides=('common-lisp' 'cl-asdf')
makedepends=('sbcl' 'texinfo')
conflicts=('sbcl')
replaces=('sbcl')
source=("http://downloads.sourceforge.net/project/sbcl/sbcl/$pkgver/sbcl-$pkgver-source.tar.bz2" "fix-source-path.lisp")
md5sums=('78c1a003281d11690f54609b4f5303f4' '8359880b74311d7340022d5211c6344b')

url="http://www.sbcl.org/"
install=sbcl.install

build() {
  unset LDFLAGS
  export CFLAGS="${CFLAGS} -DSBCL_HOME=\\\"/usr/lib/sbcl\\\""
  export GNUMAKE="make -e"
  cd ${startdir}/src/sbcl-${pkgver}
  # Make a multi-threaded SBCL, disable LARGEFILE  
  cat >customize-target-features.lisp <<EOF
(lambda (features)
  (flet ((enable (x) (pushnew x features))
         (disable (x) (setf features (remove x features))))
  (enable :sb-thread)
  (disable :largefile)))
EOF

  sh make.sh sbcl
  mkdir -p ${startdir}/pkg/usr
  pushd doc/manual
  make info || return 1
  popd 
  INSTALL_ROOT=${startdir}/pkg/usr sh install.sh

  src/runtime/sbcl --core output/sbcl.core --script ${startdir}/src/fix-source-path.lisp
  mv sbcl-new.core ${startdir}/pkg/usr/lib/sbcl/sbcl.core

# sources
  mkdir -p ${startdir}/pkg/usr/share/sbcl-source
  cp -R -t ${startdir}/pkg/usr/share/sbcl-source \
    ${startdir}/src/sbcl-${pkgver}/{src,contrib}

# drop unwanted files
  find ${startdir}/pkg/usr/share/sbcl-source -type f \
    -name \*.fasl -or \
    -name \*.o -or \
    -name \*.log -or \
    -name \*.so -or \
    -name a.out -delete

  rm ${startdir}/pkg/usr/share/sbcl-source/src/runtime/sbcl
  rm ${startdir}/pkg/usr/share/sbcl-source/src/runtime/sbcl.nm

  find ${startdir}/pkg \( -name Makefile -o -name .cvsignore \) -delete

  rm $startdir/pkg/usr/share/info/dir
  gzip -9nf $startdir/pkg/usr/share/info/*

  # license
  install -D -m644 ${startdir}/src/sbcl-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/sbcl/license.txt
}
