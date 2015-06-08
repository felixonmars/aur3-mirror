# Maintainer: Czipperz <czipperz@gmail.com>
pkgname=gvmtool
pkgver=1.0
pkgrel=4
pkgdesc="Groovy enVironment Manager - Easier Groovy installation and version management"
url="http://gvmtool.net"
arch=("any")
optdepends=('jdk8-openjdk: One jdk you can have. ONE IS REQUIRED' 'jdk7-openjdk' 'jdk')
makedepends=('curl' 'sed' 'unzip' 'bash')
depends=('java-runtime')
conflicts=()
backup=()
install=gvmtool.install

package() {
	# Global variables
	GVM_SERVICE="http://api.gvmtool.net"
	GVM_BROKER_SERVICE="http://release.gvm.io"
	GVM_VERSION="2.4.1"
	GVM_DIR="${pkgdir}${HOME}/.gvm"

	# Local variables
	gvm_bin_folder="${GVM_DIR}/bin"
	gvm_src_folder="${GVM_DIR}/src"
	gvm_tmp_folder="${GVM_DIR}/tmp"
	gvm_stage_folder="${gvm_tmp_folder}/stage"
	gvm_zip_file="${gvm_tmp_folder}/res-${GVM_VERSION}.zip"
	gvm_ext_folder="${GVM_DIR}/ext"
	gvm_etc_folder="${GVM_DIR}/etc"
	gvm_var_folder="${GVM_DIR}/var"
	gvm_config_file="${gvm_etc_folder}/config"
	gvm_bash_profile="${pkgdir}${HOME}/.bash_profile"
	gvm_profile="${pkgdir}${HOME}/.profile"
	gvm_bashrc="${pkgdir}${HOME}/.bashrc"
	gvm_zshrc="${pkgdir}${HOME}/.zshrc"
	gvm_platform=$(uname)

	gvm_init_snippet="#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s \"${GVM_DIR}/bin/gvm-init.sh\" ]] && source \"${GVM_DIR}/bin/gvm-init.sh\""



	echo "Installing gvm scripts..."


	# Create directory structure

	echo "Create distribution directories..."
	mkdir -p "${gvm_bin_folder}"
	mkdir -p "${gvm_src_folder}"
	mkdir -p "${gvm_tmp_folder}"
	mkdir -p "${gvm_stage_folder}"
	mkdir -p "${gvm_ext_folder}"
	mkdir -p "${gvm_etc_folder}"
	mkdir -p "${gvm_var_folder}"

	echo "Create candidate directories..."

	GVM_CANDIDATES_CSV=$(curl -s "${GVM_SERVICE}/candidates")
	echo "$GVM_CANDIDATES_CSV" > "${GVM_DIR}/var/candidates"

	echo "$GVM_VERSION" > "${GVM_DIR}/var/version"

	# convert csv to array
	OLD_IFS="$IFS"
	IFS=","
	GVM_CANDIDATES=(${GVM_CANDIDATES_CSV})
	IFS="$OLD_IFS"

	for (( i=0; i <= ${#GVM_CANDIDATES}; i++ )); do
		# Eliminate empty entries due to incompatibility
		if [[ -n ${GVM_CANDIDATES[${i}]} ]]; then
			CANDIDATE_NAME="${GVM_CANDIDATES[${i}]}"
			mkdir -p "${GVM_DIR}/${CANDIDATE_NAME}"
			echo "Created for ${CANDIDATE_NAME}: ${GVM_DIR}/${CANDIDATE_NAME}"
			unset CANDIDATE_NAME
		fi
	done

	echo "Prime the config file..."
	touch "${gvm_config_file}"
	echo "gvm_auto_answer=false" >> "${gvm_config_file}"
	echo "gvm_auto_selfupdate=false" >> "${gvm_config_file}"

	echo "Download script archive..."
	curl -s "${GVM_SERVICE}/res?platform=${gvm_platform}&purpose=install" > "${gvm_zip_file}"

	echo "Extract script archive..."
	unzip -qo "${gvm_zip_file}" -d "${gvm_stage_folder}"

	echo "Install scripts..."
	mv "${gvm_stage_folder}/gvm-init.sh" "${gvm_bin_folder}"
	mv "${gvm_stage_folder}"/gvm-* "${gvm_src_folder}"
}
