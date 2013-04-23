# Maintainer: Clément Junca <cju.arch -- gmail -- com>
# Contributor: Philip Müller <mail at philip.in-aachen dot net>
pkgname=opa-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Rapid + Secure Web Development"
arch=(i686 x86_64)
url="http://opalang.org"
license=(MIT AGPL)
depends=('openssl>=0.9.8' 'nodejs' 'zlib>=1.2.3.4')
optdepends=('mongodb: database backend')
provides=(opa)
conflicts=(opa-git)
replaces=()
backup=()
options=(!strip)
install=
md5sums=(368cee5fbe607eab824f569406269035)

_suffix="x86"
[[ "${CARCH}" = "x86_64" ]] && _suffix='x64' && md5sums=(656e79a35747c19b975fb721929fce23)

_source_script_name=(opa-${pkgver}.${_suffix}.run)
source=(http://doc.opalang.org/dl/linux/${_source_script_name})
noextract=(opa-${pkgver}.${_suffix}.run)

build() {
  cd $srcdir
  chmod +x $_source_script_name
  ./$_source_script_name --target $srcdir/opa --noexec --keep --nox11
}

package() {
  cd $pkgdir

  cp -a $srcdir/opa usr
  usr/share/opa/install.sh --dir usr --prefix /usr

  chmod 755 $pkgdir/usr

  rm usr/install.sh
  rm usr/share/opa/uninstall.sh
  rm usr/share/opa/install.sh

  install -d usr/share/licenses/opa-bin usr/share/vim/vimfiles/{ftdetect,syntax}

  ln -s -T /usr/share/doc/opa/copyright "usr/share/licenses/${pkgname}/COPYRIGHT"
  ln -s -T /usr/share/doc/opa/other_licenses "usr/share/licenses/${pkgname}/OTHER_LICENSES"
  ln -s /usr/share/opa/vim/ftdetect/opa.vim usr/share/vim/vimfiles/ftdetect
  ln -s /usr/share/opa/vim/syntax/opa.vim usr/share/vim/vimfiles/syntax
}
