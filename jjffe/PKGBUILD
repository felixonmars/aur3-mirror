#contributor: Jacek Poplawski <jacekpoplawski@gmail.com> 

pkgname=jjffe
pkgver=28a
pkgrel=1
pkgdesc="port of Elite 3 / Frontier 2 / First Encounters"
url="http://jaj22.org.uk/jjffe/srcjjffe.html"
depends=("sdl" "nasm")
install=()
source=(
http://jaj22.org.uk/jjffe/jjffe28a7s.zip
http://www.eliteclub.co.uk/download/firstenc.zip
)
md5sums=(
'b31436ae222d1bd373dc03ec5906680f'
'6046c3fee287499fb12d1fd287749be4'
)

build() {
	cd $startdir/src
	make -f ffelnxsdl.mak
	unzip -o -L $startdir/src/firstenc.zip -d $startdir/src/fe
	install -d $startdir/pkg/usr/bin
	install -d $startdir/pkg/usr/share/jjffe
	install $startdir/src/ffelnxsdl $startdir/pkg/usr/share/jjffe
	cp -R $startdir/src/fe/firstenc/game $startdir/pkg/usr/share/jjffe
	install $startdir/jjffe $startdir/pkg/usr/bin
}

#
