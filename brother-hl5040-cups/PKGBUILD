# Contributor: Joris Claassen <info at ebait org>
# Original contributor: Jonas E. Huber <info at hubjo org>
# 
# The Brother printer drivers for CUPS are essentially only wrappers around 
# the LPR drivers. This package integrates both RPMs and thus facilitates the 
# whole process of installing both, LPR drivers and CUPS wrapper.
#
# While this PKGBUILD is specific for the drivers for the HL5040 laser printer,
# it should be easily adjustable for other Brother drivers. When I find the
# time, I'll write a little howto in the wiki or extend the existing one.  
# 
# Don't hesitate to contact me if you have further questions or suggestions.

pkgname=brother-hl5040-cups
_cups=cupswrapperHL5040-1.0.2
_lpr=hl5040lpr-1.1.2
pkgver=1.0.2
pkgrel=1
pkgdesc="CUPS driver for HL-5040 laser printer, including underlying LPR driver."
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=('GPL2' 'custom:brother')
depends=('cups' 'ghostscript' 'lib32-glibc' 'cpio')
makedepends=('rpmextract')
source=("http://www.brother.com/pub/bsc/linux/dlf/$_cups-1.i386.rpm"
		"http://www.brother.com/pub/bsc/linux/dlf/$_lpr-1.i386.rpm"
		'license.txt'
		'cupswrapper.patch'
		)
md5sums=('1ed0a8acbf5d5da5c3f8d6cee4f26c9c'
         '0e412d243fb61d8db0b8c858c06989a9'
         '73cf49a126378f8dc7e6f3b444a1ff57'
         '5203761298aea4556b0b4af2f8e40775')

build() {
	
	# Clean up
	rm -rf usr
	rm -rf var
	
	# Install LPD driver
	# =====================
	# Note that some paths are changed in order to comply with the Arch packaging
	# standard. You have to make these changes also in the patch for the CUPS wrapper!
	
	# Extracting RPM
	cd $srcdir
	rpmextract.sh "$_lpr-1.i386.rpm" || return 1
	rm "$_lpr-1.i386.rpm"
	
	# Move into new directory structure
	mkdir -p usr/share/ || return 1
	mv usr/local/Brother usr/share/brother || return 1
	rm -rf usr/local || return 1
	
	# Install the *custom* license for the LPR driver.
	install -D -m644 license.txt usr/share/licenses/$pkgname/license.txt || return 1
	
	
	# Install CUPS wrapper
	# ====================
	
	# Extracting RPM
	rpmextract.sh "$_cups-1.i386.rpm" || return 1
	rm "$_cups-1.i386.rpm"
	
	# Move brcupsconfig to correct location
	install -D usr/local/Brother/cupswrapper/brcupsconfig usr/share/brother/cupswrapper/brcupsconfig
	
	# Move script to main directory
	mv "usr/local/Brother/cupswrapper/$_cups" . || return 1
	rm -rf usr/local || return 1
	
	# The patch disables everything except the generation of the PPD and filter
	# which are written into separate files in the CWD by executing the script.
	patch < cupswrapper.patch
	./$_cups

	# Install PPD and filter
	install -D -m644 HL5040.ppd usr/share/cups/model/HL5040.ppd || return 1
	install -D -m755 brlpdwrapperHL5040 usr/lib/cups/filter/brlpdwrapperHL5040 || return 1
	
	# Adapt paths where necessary
	sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./` || return 1
	
	# Create and install the file 'brPrintList'. This file must exist and contain the name 
	# of the printer in order to make CUPS settings work. Else, settings done in CUPS are
	# not reflected in the file /usr/share/brother/inf/brHL5040rc and thus are not considered
	# by the LPR driver that's doing the actual printing.
	echo "HL5040" > brPrintList
	install -D -m644 brPrintList usr/share/brother/inf/brPrintList
	
	# Clean up
	rm HL5040.ppd
	rm brlpdwrapperHL5040
	rm brPrintList
	
	# Move everything into the pkg directory
	find . | cpio -p -dum $pkgdir || return 1
}
