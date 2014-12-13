# Maintainer: Jonathan Ryan <jonathan.ryan@oracle.com>
pkgname=oracle-database-client
pkgver=12.1.0.2.0
pkgrel=1
epoch=
pkgdesc="Oracle Database Client. Includes sqlplus and sqlldr."
arch=('x86_64')
url="http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-2240591.html"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('oracle-instantclient-basic' 'oracle-instantclient-sqlplus')
replaces=()
backup=()
options=()
install=
changelog=
# You must download linuxamd64_12102_client.zip from the URL above manually.
source=('linuxamd64_12102_client.zip' 'client.rsp.template' 'program-link.template')
noextract=()
md5sums=('d2cbc86435823d0bffeb663ebbbb10e5'
         'f93ebb60a5133c914f90c8dbb4649215'
         'd72b5992dc5ddb30691353101a54d63e')

prepare() {
  cp client.rsp.template client.rsp
  sed "s@PKGDIR_REPLACE@${srcdir}@g" client.rsp.template > client.rsp
}

build() {
  rm -rf opt
  pushd client
    ./runInstaller -silent -waitforcompletion -showProgress -responseFile "${srcdir}/client.rsp"
  popd

  mkdir -p usr/bin
  files=('sqlldr' 'sqlplus')
  for x in "${files[@]}"; do
    sed "s/EXE_REPLACE/$x/g" program-link.template > "usr/bin/$x"
    chmod +x "usr/bin/$x"
  done
}

package() {
  cp -r "$srcdir/usr" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
}
