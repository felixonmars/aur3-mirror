# Maintainer: gok <gok@openmailbox.org>
# Contributor: Marcos Raimundo <marcosmrai@gmail.com>

# Before building this PKGBUILD, you must download the Gurobi Optimizer
# archive at http://www.gurobi.com/download/gurobi-optimizer and put it
# in the same directory as this PKGBUILD. Registration at gurobi.com is
# required, though free of charge, to be able to download the archive.

pkgname=gurobi
pkgver=6.0.3
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
arch=('x86_64')
url="http://www.gurobi.com/products/gurobi-optimizer/gurobi-overview"
license=('custom')
install=${pkgname}.install
depends=('python2>=2.7.0' 'python2<2.8.0')
optdepends=(
  'gcc: C/C++ programming interfaces support'
  'java-environment: Java programming interface support'
  'mono: .NET programming interface support'
  'python-gurobi: Python 3 programming interface support'
  'r-gurobi: R programming interface support'
  'matlab: MATLAB programming interface support, versions 2008b to 2014b'
)
source=(
  "${pkgname}${pkgver}_linux64.tar.gz::file://${pkgname}${pkgver}_linux64.tar.gz"
  "gurobi-python2.sh"
  "gurobi_setup.m"
)
sha256sums=('ff02434767f67674d3a1125db9c70d86ff386e794c5ea615fef6ec65d9572f89'
            '46c6ab3003d8b48bdd2c0b1d15e2926d178204fac0f4308032e499f665a976ae'
            '2c3ed2f880d9db9683046dceb69e53d7fb744f69ca3702dd324e88a010dd29ea')
options=('staticlibs')

prepare() {
  cd "$srcdir/${pkgname}${pkgver//./}/linux64/"

  rm bin/python2.7
  rm -r examples/build/

  # Adapt cross-platform scripts to Arch Linux
  cp ${srcdir}/gurobi-python2.sh bin/
  cp ${srcdir}/gurobi_setup.m matlab/
  sed -ie "s/python/python2/" lib/gurobi.py
}

package() {

  cd "$srcdir/${pkgname}${pkgver//./}/linux64/"

  install -d "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/doc/${pkgname}/" \
          "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/${pkgname}/matlab/"

  # License
  install -D -m644 EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Examples
  install -D -m644 bin/gurobi.env "${pkgdir}/usr/share/${pkgname}/gurobi.env"
  cp -r examples/ "${pkgdir}/usr/share/${pkgname}/"
  
  # Binaries and related files
  rm bin/gurobi.env
  install bin/* "${pkgdir}/usr/bin/"
  ln -sf gurobi-python2.sh "${pkgdir}/usr/bin/gurobi.sh"
  install -D lib/gurobi.py "${pkgdir}/usr/lib/${pkgname}/gurobi.py"

  # Documentation
  cp -rT docs/ "${pkgdir}/usr/share/doc/${pkgname}/"

  # Headers
  install -m644 include/*.h "${pkgdir}/usr/include/"

  # Programming interfaces
  install lib/*.so* "${pkgdir}/usr/lib/"
  install -m644 lib/*.a "${pkgdir}/usr/lib/"
  ln -sf ./libgurobi.so.6.0.3 "${pkgdir}/usr/lib/libgurobi60.so"
  ln -sf ./libgurobi_g++4.2.a "${pkgdir}/usr/lib/libgurobi_c++.a"

  python2 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 lib/gurobi.jar "${pkgdir}/usr/share/java/${pkgname}/gurobi.jar"

  install matlab/*.mexa64 "${pkgdir}/usr/lib/${pkgname}/matlab/"
  install -m644 matlab/*.m "${pkgdir}/usr/lib/${pkgname}/matlab/"
}
