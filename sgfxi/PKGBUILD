## PKGBUILD [plain_text]
## Version: 1.3
# Contributor: Joshua Neuhard <fester4200@gmail.com>
# Maintainer: 	leonid Gnezdilov <leonecomdir@gmail.com>
pkgname="sgfxi"
pkgver="4.23.56"
pkgrel="2"
pkgdesc="Automatic Nvidia/Ati Driver Installer For Archlinux"
url="http://sgfxi.googlecode.com"
license=('GPLv2 or any later version')
arch=('any')
conflicts=('sgfxi')
provides=('sgfxi')
options=()
depends=('wget' 'grub')
makedepends=()
#source=('http://sgfxi.googlecode.com/svn/trunk/sgfxi')
source=()
md5sums=()

## note a few things here: we test for bad wget download, remove pkg if error
## then test for EOF marker in file to ensure complete download occured, if so
## install it. If no EOF file, the file download was corrupted and the installer
## returns error after deleting the corrupted file.

#build() {

#}

 package() {
	local sgfxiName="sgfxi"
	cd "$srcdir"
	wget -O $sgfxiName "http://sgfxi.googlecode.com/svn/trunk/$sgfxiName"
	# test wget return value, on error kill rm and return error
	if [ "$?" -ne 0 ];then
		if [ -f "$sgfxiName" ];then
                        msg2 "Removing $sgfxiName file because of wget error..."
			rm "$sgfxiName"
			msg2 "$sgfxiName PackageBuild failed due to wget error."
		fi
		return 1
	# test for script EOF marker, if there, success
	elif [ -n "$( grep -si '##\*\*EOF\*\*##' $sgfxiName )" ];then
		install -D -m 755 $sgfxiName $pkgdir/usr/bin/$sgfxiName
		return 0
	# if not, failure, rm if file exists
	else
		if [ -f "$sgfxiName" ];then
			msg2 "Removing $sgfxiName file because of data corruption error..."
			rm "$sgfxiName"
			msg2 "$sgfxiName PackageBuild failed due to file corruption error."
		fi
		return 1
	fi
   }

