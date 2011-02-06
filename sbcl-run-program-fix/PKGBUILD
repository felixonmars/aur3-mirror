# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Daniel White <daniel@whitehouse.id.au>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=sbcl-run-program-fix
pkgver=1.0.31
pkgrel=3
pkgdesc="Steel Bank Common Lisp with a fix to allow passing interactive input to a subprocess invoked via RUN-PROGRAM."
arch=(i686 x86_64)
license=('custom')
makedepends=('sbcl' 'texinfo')
depends=('glibc')
provides=('common-lisp' 'cl-asdf' 'sbcl=1.0.31')
conflicts=('sbcl')
replaces=('sbcl')
source=("http://downloads.sourceforge.net/project/sbcl/sbcl/$pkgver/sbcl-$pkgver-source.tar.bz2" "fix-source-path.lisp"
"run-program.diff")

url="http://www.sbcl.org/"
install=sbcl.install

build() {
  export CFLAGS="${CFLAGS} -DSBCL_HOME=\\\"/usr/lib/sbcl\\\""
  export GNUMAKE="make -e"
  cd ${startdir}/src/sbcl-${pkgver}
  patch -p1 < "$srcdir/run-program.diff"
  # Make a multi-threaded SBCL, disable LARGEFILE  
  cat >customize-target-features.lisp <<EOF
(lambda (features)
  (flet ((enable (x) (pushnew x features))
         (disable (x) (setf features (remove x features))))
  (enable :sb-thread)
  (enable :run-program-fix)
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

md5sums=('a61fd099a72c2d3fa10a57298f3c9bf6'
         'e0fb2483602d260ba602a0fbf37ae09f'
         'd2373b6e210948a7dbe3247792bc144b')
sha1sums=('4a4b74de174f97050a2785ac4559aa6dd48a3d09'
          '94d67c9907f96a7aeec06e3a009e5fe0c69d05f9'
          'f48461cfe87b58e441f64c5bd5fa3c23289c9c53')
