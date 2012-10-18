pkgname=python31
pkgver=3.1.5
pkgrel=1
_pybasever=3.1
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind')
optdepends=('tk: for tkinter' 'sqlite')
options=('!makeflags')
source=(http://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz
        python-internal-expat.patch)
sha1sums=('3fa78edeefd892a50b5f41bab018b51ecad0b56f'
          '8e941c213718863bc6843b93ff6144e57ebcb097')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  patch -Np0 -i ../python-internal-expat.patch
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*

  export OPT="${CFLAGS}"
  export CPPFLAGS+="`pkg-config --cflags-only-I libffi`"
  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-valgrind \
              --with-wide-unicode \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi

  make
}

# XXX disabled
check_DISABLED() {
  cd "${srcdir}/Python-${pkgver}"
  LD_LIBRARY_PATH="${srcdir}/Python-${pkgver}":${LD_LIBRARY_PATH} \
     "${srcdir}/Python-${pkgver}/python" -m test.regrtest -x test_distutils test_site \
     test_urllib test_uuid test_pydoc
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

  # fix conflicts with python
  mv "${pkgdir}"/usr/bin/idle{3,-3.1}
  mv "${pkgdir}"/usr/bin/pydoc{3,-3.1}
  mv "${pkgdir}"/usr/bin/2to3{,-3.1}

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}.so \
    ${pkgdir}/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
