# Maintener: Deather <deather.jeuxlinux@gmail.com>

pkgname=battlejump-levels
pkgver=1.0
pkgrel=2
pkgdesc="All unofficial levels from the official website."
arch=('i686' 'x86_64')
url="http://www.battlejump.com/unofficialLevels"\
"-en-battle-jump-level-manager.html"
# License not been set because it is composed of 
# multiple licenses
license=('')
depends=('battlejump')
install="${pkgname}.install"

build(){
	# Get the zip with another way because the md5sum is variable
	_level_zip="all-custom-levels.zip"
	_source="http://www.battlejump.com/${_level_zip}"
	_name_folder_battlejump="battlejump"
	_name_folder_levels="Levels"
	_name_folder_downloaded="Downloaded"

	_path_level_custom="usr/share/${_name_folder_battlejump}/"\
"${_name_folder_levels}/${_name_folder_downloaded}"
	
	_save_downloaded_file=".downloaded"

	cd ${srcdir}
	
	if test -e "../${_level_zip}"; then
		msg "Zip file is already downloaded"
		cp "../${_level_zip}" "${srcdir}"
	else
		msg "Downloading zip file ..."
		wget "${_source}" 1>/dev/null 2>/dev/null
	fi

	mkdir -p "${pkgdir}/${_path_level_custom}"

	cd "${pkgdir}/${_path_level_custom}"
	msg "Decompressing zip file ..."
	unzip "${srcdir}/${_level_zip}" 1>/dev/null

	msg "Levels are decompressed in /usr/share/battlejump/"\
"Levels/Downloaded"

	ls | grep -v "readme.txt" > "${_save_downloaded_file}"
}
