# Maintainer: Martin F. Schumann <mfs@mfs.name>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=python2-chrome
pkgver=2.7.5
pkgrel=1
_pybasever=2.7
pkgdesc="A high-level scripting language. With chrome and chromium in webbrowser.py."
arch=('i686' 'x86_64')
license=('PSF')
url="http://www.python.org/"
depends=('bzip2' 'gdbm' 'openssl' 'zlib' 'expat' 'sqlite' 'libffi')
makedepends=('tk>=8.6.0' 'bluez')
optdepends=('tk: for IDLE')
provides=("python2=${pkgver}")
conflicts=('python<3' 'python2')
options=('!makeflags')
source=("http://www.python.org/ftp/python/${pkgver%rc?}/Python-${pkgver}.tar.xz" 'webbrowser-chrome.patch' 'webbrowser-chrome-doc.patch')
sha1sums=('b7389791f789625c2ba9d897aa324008ff482daf'
          '837f251f328d899b93081aa73aae3c3f61b490fa'
          'd13f427b8a27711d0130343ccaad50da3dbdb2bf')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_pybasever}/" Python/pythonrun.c

  # Enable built-in SQLite module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2|" Lib/cgi.py

  sed -i "s/python2.3/python2/g" Lib/distutils/tests/test_build_scripts.py \
     Lib/distutils/tests/test_install_scripts.py Tools/scripts/gprof2html.py
  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*

  # Apply patches for chrome to webbrowser
  # See http://bugs.python.org/issue13620
#  patch Lib/webbrowser.py ${srcdir}/webbrowser-chrome.patch
  patch Doc/library/webbrowser.rst ${srcdir}/webbrowser-chrome-doc.patch

  export OPT="${CFLAGS}"
  ./configure --prefix=/usr --enable-shared --with-threads --enable-ipv6 \
              --enable-unicode=ucs4 --with-system-expat --with-system-ffi \
              --with-dbmliborder=gdbm:ndbm

  make
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  make DESTDIR="${pkgdir}" altinstall maninstall

  rm "${pkgdir}"/usr/share/man/man1/python.1

  ln -sf python${_pybasever}        "${pkgdir}"/usr/bin/python2
  ln -sf python${_pybasever}-config "${pkgdir}"/usr/bin/python2-config
  ln -sf python${_pybasever}.1      "${pkgdir}"/usr/share/man/man1/python2.1

  # FS#33954
  ln -sf python-${_pybasever}.pc    "${pkgdir}"/usr/lib/pkgconfig/python2.pc

  ln -sf ../../libpython${_pybasever}.so "${pkgdir}"/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so

  mv "${pkgdir}"/usr/bin/smtpd.py "${pkgdir}"/usr/lib/python${_pybasever}/

  # some useful "stuff"
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # fix conflicts with python
  mv "${pkgdir}"/usr/bin/idle{,2}
  mv "${pkgdir}"/usr/bin/pydoc{,2}
  mv "${pkgdir}"/usr/bin/2to3{,-2.7}

  # clean up #!s
  find "${pkgdir}"/usr/lib/python${_pybasever}/ -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"

  # clean-up reference to build directory
  sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}"/usr/lib/python${_pybasever}/config/Makefile

  # license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
