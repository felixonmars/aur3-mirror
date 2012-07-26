# $Id: PKGBUILD 157413 2012-04-28 09:27:14Z allan $
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributer: Allan McRae <allan@archlinux.org>
# Contributer: Jason Chu <jason@archlinux.org>

pkgname=python2-x32
pkgver=2.7.3
pkgrel=1
_pybasever=2.7
pkgdesc="A high-level scripting language"
arch=('i686' 'x86_64')
license=('PSF')
url="http://www.python.org/"
depends=('libx32-bzip2' 'libx32-gdbm' 'libx32-openssl' 'libx32-zlib' 'libx32-expat' 'libx32-sqlite3' 'libx32-libffi')
#makedepends=('tk')
#optdepends=('tk: for IDLE')
#conflicts=('python<3')
options=('!makeflags')
source=(http://www.python.org/ftp/python/${pkgver%rc?}/Python-${pkgver}.tar.xz)
sha1sums=('b2b0ada7ebed4a8204a855193afbdb3aa3308357')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_pybasever}/" Python/pythonrun.c

  # Enable built-in SQLite module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2-x32|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*

  export OPT="${CFLAGS}"
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  ./configure --prefix=/opt/python2-x32 --enable-shared --with-threads --enable-ipv6 \
              --enable-unicode=ucs4 --with-system-expat --with-system-ffi \
              --with-dbmliborder=gdbm:ndbm

  make
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  make DESTDIR="${pkgdir}" altinstall maninstall

  mkdir -p ${pkgdir}/usr/bin
  ln -sf /opt/python2-x32/bin/python${_pybasever}        "${pkgdir}/usr/bin/python2-x32"
  ln -sf /opt/python2-x32/bin/python${_pybasever}-config "${pkgdir}/usr/bin/python2-x32-config"
  #ln -sf python${_pybasever}.1      "${pkgdir}/usr/share/man/man1/python2.1"

  #ln -sf ../../libpython${_pybasever}.so \
  #  "${pkgdir}/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so"

  mv "${pkgdir}/opt/python2-x32/bin/smtpd.py" "${pkgdir}/opt/python2-x32/lib/python${_pybasever}/"

  # some useful "stuff"
  install -dm755 "${pkgdir}"/opt/python2-x32/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py \
    "${pkgdir}/opt/python2-x32/lib/python${_pybasever}/Tools/i18n/"
  install -m755 Tools/scripts/{README,*py} \
    "${pkgdir}/opt/python2-x32/lib/python${_pybasever}/Tools/scripts/"

  # fix conflicts with python
  #mv "${pkgdir}"/usr/bin/idle{,2}
  #mv "${pkgdir}"/usr/bin/pydoc{,2}
  #mv "${pkgdir}"/usr/bin/2to3{,-2.7}

  # clean up #!s
  find "${pkgdir}/opt/python2-x32/lib/python${_pybasever}/" -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2-x32|"

  # clean-up reference to build directory
  sed -i "s#${srcdir}/Python-${pkgver}:##" \
    "${pkgdir}/opt/python2-x32/lib/python${_pybasever}/config/Makefile"

  # license
  install -Dm644 LICENSE "${pkgdir}/opt/python2-x32/share/licenses/${pkgname}/LICENSE"

  # ld config
  mkdir -p ${pkgdir}/etc/ld.so.conf.d
  echo '/opt/python2-x32/lib' > ${pkgdir}/etc/ld.so.conf.d/python2-x32.conf
}
