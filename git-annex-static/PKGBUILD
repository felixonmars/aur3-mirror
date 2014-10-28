# Maintainer: Nicolas Reynolds <fauno@kiwwwi.com.ar>
# Based on haskell-git-annex

# Run `makepkg -sp SRCBUILD` if you want to update the source tarball

# hslua fails if LANG is empty or C
test -z "$LANG" && export LANG="en_US.utf8"

pkgname=git-annex-static
_pkgname=git-annex
pkgver=5.20141024
pkgrel=1
_srcrel=1
pkgdesc='Manage files with git, without checking their contents in'
url='http://git-annex.branchable.com/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('git' 'gsasl')
makedepends=('ghc' 'sh' 'cabal-install' 'alex' 'happy')
options=(strip !makeflags !distcc !emptydirs)
source=(https://repo.parabolagnulinux.org/other/git-annex-static/${_pkgname}-${pkgver}-${_srcrel}-any.src.tar.xz{,.sig}
        SRCBUILD)
replaces=('git-annex')
provides=('git-annex')
md5sums=('5c1760042568c068d76087a24776715f'
         'SKIP'
         'c62b7f7093662f2e672b562bb97c86ae')

# PKGBUILD functions
build() {
   mkdir -p ${srcdir}/{build,${_pkgname}-${pkgver}}
   cd ${srcdir}/${_pkgname}-${pkgver}

   export PATH=${srcdir}/build/usr/bin:$PATH

   while read _hkpkg extra; do
# Skip already built
       [ -d "${srcdir}/build/usr/lib/i386-linux-ghc-7.8.3/$_hkpkg" ] && continue

       pushd ${srcdir}/${_pkgname}-${pkgver}/${_hkpkg} >/dev/null || continue

       msg2 "Building $_hkpkg"
       HOME=${srcdir}/${_pkgname}-${pkgver} \
       cabal install --prefix=${srcdir}/build/usr

       popd >/dev/null
   done <BUILDORDER

}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}

  install -Dm755 ${srcdir}/build/usr/bin/git-annex ${pkgdir}/usr/bin/git-annex

  msg2 "Installing manpages"
  install -Dm644 git-annex.1 ${pkgdir}/usr/share/man/man1/git-annex.1
  install -Dm644 git-annex-shell.1 ${pkgdir}/usr/share/man/man1/git-annex-shell.1

  msg2 "Installing licenses"
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -rv ${srcdir}/build/usr/share/doc/* ${pkgdir}/usr/share/licenses/${pkgname}
}
