# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=lit2pdf
pkgver=0.1
pkgrel=2
pkgdesc="A program that converts Microsoft Reader .lit files to Acrobat .pdf files."
arch=('i686' 'x86_64')
url="http://lit2pdf.jenxi.com/"
license=('custom')
depends=('clit' 'html2ps' 'ghostscript')
source=(http://www.petermstewart.net/content/lit2pdf
		archpatch.diff)
md5sums=('0dd3fc255f2f454d4fabc5bf894ba5ca'
         'f475c20b126cb85c4b34701080f5f022')
build() {

cd $srcdir
cp ./lit2pdf ./lit2pdfsrc
patch -p0 <archpatch.diff
install -D -m755 $srcdir/lit2pdfsrc $pkgdir/usr/bin/lit2pdf

mkdir -p $pkgdir/usr/share/licenses/lit2pdf

echo -e "Feel free to make changes, pass the script on, etc. It works well enough for my needs,\n\
But please let me know if you come up with an improvement. And remember, as the ConvertLIT\n\
usage screen says, “Please do not use this program to distribute illegal copies of ebooks.\n\
… that would make Baby Jesus sad.“" > $pkgdir/usr/share/licenses/lit2pdf/license

chmod 644 $pkgdir/usr/share/licenses/lit2pdf/license
}
