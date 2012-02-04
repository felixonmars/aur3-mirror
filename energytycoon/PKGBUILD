# Maintainer: Dan Vratil <vratil@progdansoft.com>

pkgname=energytycoon
pkgver=release2
pkgrel=1
pkgdesc="Build your own energy empire!"
arch=('i686' 'x86_64')
url="http://www.energietycoon.de/en/"
license=('MIT')
if [ $CARCH == "i686" ]; then depends=('ogre' 'boost-libs' 'tinyxml' 'irrklang' 'ois'); fi
if [ $CARCH == "x86_64" ]; then depends=('lib32-ogre' 'lib32-boost-libs' 'lib32-tinyxml' 'lib32-irrklang' 'lib32-ois'); fi
makedepends=('freetype2' 'dos2unix')
source=(http://downloads.sourceforge.net/project/energytycoon/energytycoon_${pkgver}_source.tar.gz
	http://downloads.sourceforge.net/project/energytycoon/energytycoon_${pkgver}_data.tar.gz
	etl.patch et.patch)

build_mygui() 
{
	# First build custom MyGUI
	/bin/echo -e "\033[1;32m==>\033[1;38m Compiling MyGUI\033[0m - That's gonna take some time..."
	cd ${srcdir}/energytycoon_release2_source/3rdparty/mygui/src
	gcc -m32 -Wall *.cpp -I../include -I/usr/include/OGRE -I/usr/include/freetype2 -Wl,-lstdc++,-lOIS,-lOgreMain -shared -fpic -o libmygui.so
	libmygui=${srcdir}/energytycoon_release2_source/3rdparty/mygui/src/
}

build_etl() 
{
	/bin/echo -e "\033[1;32m==>\033[1;38m Compiling ETL\033[0m - this should not take that much time..."
	cd ${srcdir}/energytycoon_release2_source/3rdparty/etl/src
	patch -p1 -i ${srcdir}/etl.patch
	gcc -m32 -Wall *.cpp -I../include -I/usr/include/OGRE -Wl,-lstdc++,-lOgreMain -shared -fpic -o libEditableTerrain.so
	libEditableTerrain=${srcdir}/energytycoon_release2_source/3rdparty/etl/src/
}

build_et() 
{
	/bin/echo -e "\033[1;32m==>\033[1;38m Compiling Energy Tycoon\033[0m - we are almost there!"
	cd ${srcdir}/energytycoon_release2_source/source
	if [ ! -d includes ]; then
		mkdir includes
		ln -sf ../../3rdparty/mygui/include includes/MyGUI
		ln -sf ../../3rdparty/etl/include includes/ETL
	fi

	dos2unix *.cpp *.h
	patch -p1 -i ${srcdir}/et.patch
 	gcc -m32 *.cpp -Iincludes -Iincludes/MyGUI -Iincludes/ETL -I/usr/include/irrKlang -I/usr/include/OGRE \
 	    -Wl,-L${srcdir}/energytycoon_release2_source/3rdparty/mygui/src \
	    -Wl,-L${srcdir}/energytycoon_release2_source/3rdparty/etl/src \
	    -Wl,-lstdc++,-lOgreMain,-ltinyxml,-lIrrKlang,-l:libmygui.so,-l:libEditableTerrain.so \
	    -o energytycoon 
}

build()
{
	build_mygui
	build_etl
	build_et
}

package()
{
	mkdir -p ${pkgdir}/usr/bin
	install ${srcdir}/energytycoon_release2_source/source/energytycoon ${pkgdir}/usr/bin/energytycoon.bin

	mkdir -p ${pkgdir}/usr/share/games/energytycoon
	install ${srcdir}/energytycoon_release2_source/3rdparty/mygui/src/libmygui.so ${pkgdir}/usr/share/games/energytycoon
	install ${srcdir}/energytycoon_release2_source/3rdparty/etl/src/libEditableTerrain.so ${pkgdir}/usr/share/games/energytycoon

	cp -r ${srcdir}/energytycoon/* ${pkgdir}/usr/share/games/energytycoon

	if [ $CARCH == "i686" ]; then
		echo -e "#!/bin/sh\nLD_LIBRARY_PATH=/usr/share/energytycoon /usr/bin/energytycoon.bin" > ${pkgdir}/usr/bin/energytycoon
	else
		echo -e "#!/bin/sh\nLD_LIBRARY_PATH=/usr/share/energytycoon:/usr/lib32 /usr/bin/energytycoon.bin" > ${pkgdir}/usr/bin/energytycoon
	fi
	chmod a+x ${pkgdir}/usr/bin/energytycoon
}

md5sums=('55f1b56271c33ee922fbd1df4958a90f'
         '0fe30adf8e30a8921deaf4347974fd5e'
         '1bf0a3a54414cf99e19667c5f1cf9b17'
         '9b2a2e40f607c143a7574d2b7f22c6a3')
