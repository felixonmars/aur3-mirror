# Maintainer: Hinrich Harms <arch@hinrich.de>

pkgname=enigmail-cvs
pkgver=20110515
pkgrel=1
pkgdesc="OpenPGP security extension for Mozilla Thunderbird 3"
arch=('i686' 'x86_64')
url="http://enigmail.mozdev.org"
license=('MPL' 'GPL')
makedepends=('cvs' 'zip')
depends=('gnupg' 'thunderbird>=3.1')
provides=('enigmail')
conflicts=('enigmail')
options=('!ccache' '!distcc')
source=(".mozconfig")
md5sums=('617350ce8a24db211a8f924246c285ee')

_cvsmod="enigmail/src"
_cvsroot=":pserver:guest:guest@mozdev.org:/cvs"

_tb_hgroot="http://hg.mozilla.org/comm-central/"
_tb_hgname="comm-central"

# Thunderbird lib directory for XPI installation:
_tb_libdir=thunderbird-3.1

build() {
	# Checkout of Thunderbird
	msg "Connecting to Thunderbird Mercurial server..."
	[[ ! -d ${_hgname} ]] && hg clone http://hg.mozilla.org/comm-central/
	msg "Updating the tree..."
	cd comm-central && rm -rf obj-* && python2 client.py checkout
	msg "Mercurial checkout done or server timeout"

	# Checkout of Enigmail
	cd $startdir/src
	msg "Connecting to CVS server...."
	cvs -z3 -d $_cvsroot co $_cvsmod
	msg "CVS checkout done or server timeout"

	# Thunderbird
	msg "Compiling needed parts of Thunderbird..."
	cd $srcdir
	_comm_dir=$(ls -1d comm-* |sort |tail -1)
	cd $_comm_dir
	# export MOZCONFIG="$startdir/mozconfig"
	cp "$startdir/.mozconfig" "$srcdir/$_comm_dir"
	make -f client.mk configure

	_obj_dir=obj # This is defined in the .mozconfig
	cd $_obj_dir
	#make -C mozilla tier_base
	#make -C mozilla tier_nspr
	#make -C mozilla tier_js
	#make export
	#make -C mozilla/modules/libreg
	#make -C mozilla/xpcom/string
	#make -C mozilla/xpcom
	make all

	# Enigmail
	msg "Compiling Enigmail..."
	mv $srcdir/enigmail/src $srcdir/$_comm_dir/mailnews/extensions/enigmail

	cd $srcdir/$_comm_dir/mailnews/extensions/enigmail
	./makemake -r # OBJ_DIR is read from .mozconfig

	cd $srcdir/$_comm_dir/$_obj_dir/mailnews/extensions/enigmail
	make
	
	# Create xpi file
	make xpi
	msg "XPI file created."

	# Install to the thunderbird lib directory
	_emid=`grep em:id package/install.rdf | head -n1 | sed 's/.*>\(.*\)<.*/\1/'`
	mkdir -p $pkgdir/usr/lib/$_tb_libdir/extensions/$_emid
	cd $pkgdir/usr/lib/$_tb_libdir/extensions/$_emid
	# Look for the current (highest) version number of the xpi
	_xpidir=$srcdir/$_comm_dir/$_obj_dir/mozilla/dist/bin
	_xpifullpath=`ls $_xpidir/enigmail-*-linux-$CARCH.xpi | sort | sed -n '$p'`
	bsdtar -x -f $_xpifullpath
}
