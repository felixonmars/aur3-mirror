# $Id: PKGBUILD 167 2009-06-29 10:11:22Z shtrom $
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=minizinc
pkgver=1.0
pkgrel=1
pkgdesc="MiniZinc is a modelling language for constraint programming problems"
arch=(i686 x86_64)
url="http://www.g12.cs.mu.oz.au/minizinc/"
license=('custom:BSD-Nicta')
optdepends=('vim: a versatile editor (for which Zinc support files are provided)')
_targetspec=i686-pc-linux-gnu
if [ $CARCH = x86_64 ]; then
  _targetspec=x86_64-unknown-linux-gnu
fi
source=(http://www.g12.cs.mu.oz.au/minizinc/downloads/release-0.10/${pkgname}-${pkgver}-${_targetspec}.tar.gz)
md5sums=() #intentionnaly left blank to work for both architectures

build() {
  mkdir -p ${pkgdir}/usr/{bin,lib,share/{vim/syntax/,{,doc/,licenses/}${pkgname}}}
  find ${srcdir}/${pkgname}-${pkgver}/bin -type f -exec install -D -m 0755 {} ${pkgdir}/usr/bin/ \;
  
  cat > ${pkgdir}/usr/bin/mzn2fzn << EOF
#!/bin/sh

export MZN_STDLIB_DIR="/usr/lib/minizinc"
exec "/usr/bin/mzn2fzn-actual" "\$@"
EOF
  cat > ${pkgdir}/usr/bin/minizinc << EOF
#!/bin/sh

export MZN_STDLIB_DIR="/usr/lib/minizinc"
exec "/usr/bin/minizinc-actual" "\$@"
EOF
  chmod 0755 ${pkgdir}/usr/bin/{mzn2fzn,minizinc}

  cp -R ${srcdir}/${pkgname}-${pkgver}/lib/minizinc/ ${pkgdir}/usr/lib/

  cp -R ${srcdir}/${pkgname}-${pkgver}/{benchmarks,examples,fcts,scripts,tests,xml} \
    ${pkgdir}/usr/share/${pkgname} 

  cp -R ${srcdir}/${pkgname}-${pkgver}/doc ${pkgdir}/usr/share/doc/${pkgname}

  install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/tools/vim/zinc.vim \
    ${pkgdir}/usr/share/vim/syntax/
  install -D -m 0644 ${srcdir}/${pkgname}-${pkgver}/COPYING \
    ${pkgdir}/usr/share/license/${pkgname}/

}

# vim:set ts=2 sw=2 et:
