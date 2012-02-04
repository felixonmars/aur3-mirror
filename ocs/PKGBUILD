# Contributor: Patrick Bartels <patrick.bartels@campus.tu-berlin.de>
# 
# The patches were taken from Benjamin Drung's Debian package.
# See: http://bazaar.launchpad.net/~bdrung/+junk/ocs/files/head:/debian/

pkgname="ocs"
pkgver="2.4"
pkgrel="1"
pkgdesc="OPAL Compilation System for the OPAL functional programming language"
arch=("i686")
url="https://projects.uebb.tu-berlin.de/opal/trac/"
license=("GPL")
makedepends=("gcc" "glibc")
depends=("tcl" "tk" "readline" "flex")
source=("https://projects.uebb.tu-berlin.de/opal/trac/raw-attachment/wiki/OCS/ocs-$pkgver.tar.gz"
        fix-typos.patch
        fix-manpage-errors.patch
        add-DESTDIR-support.patch
        distclean-target.patch
        use-system-wish.patch)
md5sums=("79c2a86eb4c60c1b54a0dd7cca9e8f7e"
         "49750a197909e0b8f25823ae7053ae8c"
         "1640717dd7a62fec5e8539a50d2b7924"
         "9ebed4b72baae9dfa35bf9de28038659"
         "19fcce22483339d49fbf3824d3a75a54"
         "6c7b89485879dfe7eebecebdf5cddbdb")

build() {
	cd "$srcdir/ocs-$pkgver"

	msg2 "Applying patches..."
        for patch in fix-typos.patch fix-manpage-errors.patch \
                     add-DESTDIR-support.patch distclean-target.patch \
                     use-system-wish.patch; do
		patch -Np1 -i "$srcdir/$patch"
	done

	msg2 "Configuring build environment..."
	./configure --prefix="/usr"

	# Excerpt from Makefile.in:
	#    usage:
	#            @echo "There is no default target. Run \`make install' instead."
	#            @echo "The build and installation steps of OCS are interleaved for"
	#            @echo "bootstrapping reasons."
	# Thus ocs cannot be installed in package()
	msg2 "Building and installing ocs..."
	make DESTDIR="$pkgdir" install
}

package() {
	msg2 "Fixing ocs' folder structure to follow the Arch packaging standards..."
	mkdir -p "$pkgdir/usr/share/doc/ocs"
	mv "$pkgdir/usr/doc/"* "$pkgdir/usr/share/doc/ocs"
	mv "$pkgdir/usr/examples" "$pkgdir/usr/share/doc/ocs"
	mv "$pkgdir/usr/man" "$pkgdir/usr/share"

	msg2 "Installing OPAL syntax highlighting file for VIM..."
	install -D -m644  "$pkgdir/usr/lib/vim/opal.vim" \
		"$pkgdir/usr/share/vim/vimfiles/syntax/opal.vim"

	msg2 "Removing unnecessary files..."
	rm "$pkgdir/usr/VERSION"
	rm -r "$pkgdir/usr/"{packages,doc,lib/{emacs,vim}}
}

