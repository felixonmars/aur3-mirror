# Maintainer: whity <andregoncalo.bras@gmail.com>
pkgname=sqlworkbench
pkgver=112
pkgrel=1
epoch=
pkgdesc="SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool."
arch=('any')
url="http://www.sql-workbench.net/"
license=('custom')
groups=()
depends=('java-runtime>=6')
makedepends=(
  'unzip' 
  'html2text'
)
checkdepends=()
optdepends=()
provides=('SQLWorkbench')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.sql-workbench.net/Workbench-Build${pkgver}.zip")
noextract=("Workbench-Build${pkgver}.zip")
md5sums=('0a53a2b62a40ec1122a33ea66adf5ee7') #generate with 'makepkg -g'

build() {
  unzip "Workbench-Build${pkgver}".zip
  rm "Workbench-Build${pkgver}".zip

  #add desktop file categories and exec
  echo Categories=Development >> SQLWorkbench.desktop
  echo Exec=java -jar /opt/SQLWorkbench/sqlworkbench.jar >> SQLWorkbench.desktop

  #create license file
  cd manual
  html2text -o '../license.txt' information.html
}

package() {
  #create dirs
  mkdir -p $pkgdir/opt/SQLWorkbench
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/licenses/sqlworkbench/

  ###go to source dir
  cd $srcdir

  install *.* $pkgdir/opt/SQLWorkbench

  #create license link
  ln -s /opt/SQLWorkbench/license.txt $pkgdir/usr/share/licenses/sqlworkbench/license.txt

  #create app desktop link
  ln -s /opt/SQLWorkbench/SQLWorkbench.desktop $pkgdir/usr/share/applications/SQLWorkbench.desktop

  #create app link in /usr/bin
  ln -s /opt/SQLWorkbench/sqlworkbench.sh $pkgdir/usr/bin/sqlworkbench
}

# vim:set ts=2 sw=2 et:
