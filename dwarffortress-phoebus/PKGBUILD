# Maintainer: ian kremlin <ian [AT] kremlin [DOT] cc>
# Former Maintainer: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dwarffortress-phoebus
pkgver=0.40.19

# rewrite by kremlin, july 8th 2014
# with help from halosghost
pkgrel=17
epoch=1

pkgdesc='Dwarf Fortress preloaded with Phoebus tileset'

arch=('x86_64')
url='http://www.bay12games.com/dwarves/'
license=('custom:dwarffortress_phoebus')
groups=('games')
depends=('lib32-sdl_image' 'lib32-sdl_ttf' 'lib32-gtk2' 'lib32-glu' 'lib32-gcc-libs')

source=('https://kremlin.cc/dfmirror/Phoebus_40_19v00.zip'
		'https://kremlin.cc/dfmirror/df_40_19_linux.tar.bz2'
		'dwarf-fortress'
		'LICENSE')

md5sums=('df1a777f8defba96e14ac2baeb764bf4'
         'f0b2c798fb5e297ea3cce38a63e20443'
         '5766ed7195876418b497d912d2f1512a'
         'eddfb4bd478f9c64e6801bda7c7791ba')

prepare() {
	
	# inject DF with phoebus' tilesets
	mv "$srcdir"/raw/graphics/* "$srcdir"/df_linux/raw/graphics/
	mv "$srcdir"/raw/objects/* "$srcdir"/df_linux/raw/objects/

	cp -a --no-preserve=ownership "$srcdir"/data/art/* "$srcdir"/df_linux/data/art/
	cp -a --no-preserve=ownership "$srcdir"/data/init/phoebus/* "$srcdir"/df_linux/data/init/

	chmod -R a+rx "$srcdir"/df_linux/libs/Dwarf_Fortress
	chmod -R a+rx "$srcdir"/df_linux/data/*
	chmod -R a+rx "$srcdir"/df_linux/raw/*
	chmod -R a+rx "$srcdir"/df_linux/g_src/*

	chmod a+rx "$srcdir"/df_linux/*
	chmod a+r "$srcdir"/df_linux/sdl/sdl\ license.txt
}

package() {

	install -d "$pkgdir"/usr/lib32/"$pkgname"
   	install -m644 "$srcdir"/df_linux/libs/libgraphics.so "$pkgdir"/usr/lib32/"$pkgname"/libgraphics.so
	install -D -m755 "$srcdir"/dwarf-fortress "$pkgdir"/usr/bin/dwarf-fortress
	install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	cp -a --no-preserve=ownership "$srcdir"/df_linux/* "$pkgdir"/usr/lib32/"$pkgname"/
	mkdir -p "$pkgdir"/usr/lib32/"$pkgname"/data/save/current/

	chmod a+rw "$pkgdir"/usr/lib32/"$pkgname"/data/save/
	chmod a+rw "$pkgdir"/usr/lib32/"$pkgname"/data/save/current # save dir is worldwrite
	chmod a+w "$pkgdir"/usr/lib32/"$pkgname"/data/index # crashes otherwise
}

