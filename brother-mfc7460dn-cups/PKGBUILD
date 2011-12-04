# Contributor: Jonas E. Huber <info at hubjo org>
# 
# The Brother printer drivers for CUPS are essentially only wrappers around 
# the LPR drivers. This package integrates both RPMs and thus facilitates the 
# whole process of installing both, LPR drivers and CUPS wrapper.
#
# While this PKGBUILD is specific for the drivers for the HL5340D laser printer,
# it should be easily adjustable for other Brother drivers. When I find the
# time, I'll write a little howto in the wiki or extend the existing one.  
# 
# Don't hesitate to contact me if you have further questions or suggestions.
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=brother-mfc7460dn-cups
_cups=cupswrapperMFC7460DN-2.0.4
_lpr=mfc7460dnlpr-2.1.0
pkgver=2.0.4
pkgrel=2
pkgdesc="CUPS driver for MFC-7460DN laser printer, including underlying LPR driver."
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=('GPL2' 'custom:brother')
depends=('cups' 'ghostscript' 'lib32-glibc')
makedepends=('rpmextract' 'cpio')
source=("http://www.brother.com/pub/bsc/linux/dlf/$_cups-2.i386.rpm"
		"http://www.brother.com/pub/bsc/linux/dlf/$_lpr-1.i386.rpm"
		'license.txt'
		'cupswrapper.patch'
		)

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
	rpmextract.sh "$_cups-2.i386.rpm" || return 1
	rm "$_cups-2.i386.rpm"
	
	# Move brcupsconfig3 to correct location
	#install -D usr/local/Brother/cupswrapper/brcupsconfig3 usr/share/brother/cupswrapper/brcupsconfig3
    install -D usr/local/Brother/Printer/MFC7460DN/cupswrapper/brcupsconfig4 usr/share/brother/Printer/MFC7460DN/cupswrapper/brcupsconfig4 
	
	# Move script to main directory
	mv "usr/local/Brother/Printer/MFC7460DN/cupswrapper/$_cups" . || return 1
	rm -rf usr/local || return 1
	
	# The patch disables everything except the generation of the PPD and filter
	# which are written into separate files in the CWD by executing the script.
	patch < cupswrapper.patch
	./$_cups

	# Install PPD and filter
	install -D -m644 MFC7460DN usr/share/cups/model/MFC7460DN.ppd || return 1
	install -D -m755 brlpdwrapperMFC7460DN usr/lib/cups/filter/brlpdwrapperMFC7460DN || return 1
	
	# Adapt paths where necessary
	sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./` || return 1
	
	# Create and install the file 'brPrintList'. This file must exist and contain the name 
	# of the printer in order to make CUPS settings work. Else, settings done in CUPS are
	# not reflected in the file /usr/share/brother/inf/brHL5340Drc and thus are not considered
	# by the LPR driver that's doing the actual printing.
	echo "MFC7460DN" > brPrintList
	install -D -m644 brPrintList usr/share/brother/Printer/MFC7460DN/inf/brPrintList
	
	# Clean up
	rm MFC7460DN
	rm brlpdwrapperMFC7460DN
	rm brPrintList
    rm license.txt
    rm cupswrapperMFC7460DN-2.0.4
    rm cupswrapper.patch 
	
	# Move everything into the pkg directory
	find . | cpio -p -dum $pkgdir || return 1
}
md5sums=('4329c24062a836c2788854f901c453d3'
         'b255588a630e399e6d5bf8ec25de1d80'
         '73cf49a126378f8dc7e6f3b444a1ff57'
         '386053bbb501e33d14166e017f37b9d1')
