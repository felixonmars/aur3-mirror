# Contributor: Douglas Thrift <douglas@douglasthrift.net>
pkgname=saxon-dotnet
pkgver=8.7.3
pkgrel=1
pkgdesc="XSLT 2.0 / XPath 2.0 / XQuery 1.0 processor for .NET"
url="http://saxon.sourceforge.net/"
depends=('mono')
makedepends=('sed')
source=(http://dl.sourceforge.net/sourceforge/saxon/saxonb8-7-3n.zip saxon.sh.in)
md5sums=('061c1919988315395e15556d29709df1' 'bf25ebe367d03d6cf41278ff43ae9bde')

build() {
  cd $startdir/src/bin
  for program in `ls *.exe | sed -e 's/.exe$//'`; do
    install -D -m 755 $program.exe $startdir/pkg/usr/lib/mono/saxon/$program.exe
    sed -e "s/%%PROGRAM%%/$program/" $startdir/src/saxon.sh.in > $program
    install -D -m 755 $program $startdir/pkg/usr/bin/$program
  done
  for assembly in *.dll; do
    gacutil -i $assembly -package saxon -root $startdir/pkg/usr/lib
  done
}
