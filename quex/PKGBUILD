# Maintainer: Kringel

pkgname=quex
pkgver=0.63.1
pkgrel=2
pkgdesc='Fast Universal Lexical Analyzer Generator'
arch=('any')
url='http://quex.sourceforge.net/'
license=('LGPL')
depends=('python2')
optdepends=('pkg-config: To get pre-processor and compile flags by calling `pkg-config quex --cflags`')
source=("http://netcologne.dl.sourceforge.net/project/quex/DOWNLOAD/quex-${pkgver}.tar.gz")
options=('!strip')
sha1sums=('7432b1b911663a3dfa2975a6fe888687f8f35dff')


package() {
	local prefix=/usr/bin
	local dst=${pkgdir}/${prefix}
	mkdir -p $dst
	cp -r $srcdir/$pkgname-$pkgver $dst

	# set python2 for the sha-bang line
	sed -i 's/^\#! \/usr\/bin\/env python$/\#! \/usr\/bin\/env python2/' $dst/$pkgname-$pkgver/quex-exe.py

	# and ignore missing QUEX_PATH in environment (it gets a default)
        sed -i "s/if os.environ.has_key(\"QUEX_PATH\") == False:/if False: # we use a default if QUEX_PATH is not set/" $dst/$pkgname-$pkgver/quex-exe.py

	# default QUEX_PATH to the installation directory (to make the environment variable optional)
	# inside the python source
	find $pkgdir -iname "*.py" -exec sed -i "s/os.environ\[\"QUEX_PATH\"\]/os.getenv(\"QUEX_PATH\", \"\/usr\/bin\/$pkgname-$pkgver\/\")/" {} \;
	# and also inside the Makefiles
	find $pkgdir/$prefix/$pkgname-$pkgver/demo -iname "Makefile" -exec sed -i "s/\$(error The environment variable QUEX_PATH is not defined!)/QUEX_PATH=\/usr\/bin\/$pkgname-$pkgver\//" {} \;
	

	
	# link "quex" to the main script
	ln -s ./$pkgname-$pkgver/quex-exe.py $pkgdir/usr/bin/quex

	# create metadata file for pkg-config	
	mkdir -p $pkgdir/usr/lib/pkgconfig
	x=$pkgdir/usr/lib/pkgconfig/quex.pc
	echo "quexpath=$prefix/$pkgname-$pkgver" >> $x
	echo "Name: Quex" >> $x
	echo "Description: $pkgdesc" >> $x
	echo "Version: $pkgver" >> $x
	echo "URL: $url" >> $x
	echo "Cflags: -I\${quexpath}" >> $x
}

