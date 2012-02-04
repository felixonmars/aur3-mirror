# Maintainer: EpocSquadron <crimsonmage a gmail>
pkgname=libreoffice-extension-writer2latex-svn
_svnmod=writer2latex
_javaname=writer2latex
_exts=( writer2latex writer2xhtml writer4latex )
pkgver=1.1.8
pkgrel=1
pkgdesc="A java program and collection of LibreOffice extensions for converting to and working with LaTeX in LibreOffice"
arch=('any')
url="http://writer2latex.sourceforge.net"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common' 'java-runtime' 'java-environment')
makedepends=('svn' 'apache-ant')
conflicts=('libreoffice-extension-writer2latex')
source=('build.xml' 'writer2latex.sh')
md5sums=('542cd0704c32331dc4b26eb909af6915'
         '38fd6ef1aaf9ba7872dc5871e303942e')

build() {
  #Fetch the latest source.
  svn co https://writer2latex.svn.sourceforge.net/svnroot/writer2latex/trunk $_svnmod
  cp -r "$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #Grab the modified build file.
  mv -f "$srcdir/build.xml" "."

  #Compile the source.
  /usr/share/java/apache-ant/bin/ant compile jar oxt
}

package() {
  #Install the extensions
  for _ext in ${_exts[@]}; do
    install -D -m644 "$srcdir/$_svnmod-build/target/lib/$_ext.oxt" "$pkgdir/usr/lib/libreoffice/share/extensions/$_ext/$_ext.oxt"
    unzip -d "$pkgdir/usr/lib/libreoffice/share/extensions/$_ext/" "$pkgdir/usr/lib/libreoffice/share/extensions/$_ext/$_ext.oxt"
    chmod 0755 "$pkgdir/usr/lib/libreoffice/share/extensions/$_ext/"*.jar
  done

  #Install the java converter
  install -D -m755 "$srcdir/$_svnmod-build/target/lib/$_javaname.jar" "$pkgdir/usr/share/java/$_javaname.jar"

  #Install shell script to execute java program
  install -D -m755 "$srcdir/$_javaname.sh" "$pkgdir/usr/bin/$_javaname"
}
