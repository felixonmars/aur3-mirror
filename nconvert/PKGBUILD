#Contributor: lang2 <wenzhi.liang@gmail.com>

arch=('i686' 'x86_64')
license=('FREEWARE')
pkgname=nconvert
pkgver=5.91
pkgrel=1
pkgdesc="a batch utility to convert graphic files"
url="http://www.xnview.com/en/nconvert.html"
if [ $CARCH == 'i686' ]
then
	source=('http://download.xnview.com/NConvert-linux.tgz')
	md5sums=('c85d5a370d9d29c6e93e075aeeedb85e')
else
	source=('http://download.xnview.com/NConvert-linux64.tgz')
	md5sums=('051399a63d6cf77e064fcd65b2843395')
fi

_docs="Formats.txt ReadMe.txt Usage.txt WhatsNew.txt"

build() 
{
	cd $startdir/src/NConvert
    mkdir -p $startdir/pkg/usr/share/licenses/nconvert
	install -m 775 -D nconvert $startdir/pkg/usr/bin/nconvert
	install -m 664 -D license.txt $startdir/pkg/usr/share/licenses/nconvert
	for d in $_docs; do
		install -m 664 -D $d $startdir/pkg/usr/share/doc/nconvert/$d
	done
}

