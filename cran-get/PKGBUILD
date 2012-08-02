# Maintainer: Olivier Scholder <o.scholder@gmail.com>
pkgname=cran-get
pkgver=0.1
pkgrel=1
pkgdesc="Install automatically CRAN packages and it's dependencies"
url="http://I-don-t-have-a-website.com"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('bash' 'r')
source=()
md5sums=()

build() {
	cat << EOF > ${srcdir}/cran-get
#!/bin/bash

URL="http://stat.ethz.ch/CRAN/web/packages"

in_array() {
	local hay needle=\$1
	shift
	for hay
	do
		[[ \$hay == \$needle ]] && return 0
	done
	return 1
}

function getDep {
	 wget -q -O - \${URL}/\$1 | grep -A1 Depends | tail -n+2 | grep -oEe '([^>]*)(>?</a>)' | cut -d'<' -f1
}


function instPkg {
	P="\`wget -q -O - \${URL}/\$1 | grep -oE 'Package source.*?<a href="([^"]*)' | cut -d'"' -f2\`"
	wget -nc \${URL}/\$1/\${P}
	F=\$(basename \$P)
	echo "Extracting \$F"
	tar xf \$F
	echo "Install \$1"
	R CMD INSTALL -l \`echo \$R_LIBS_USER\` \$1
	rm -r \$1
	rm \$F
}

function processPkg {
	DEP="\`getDep \$1\`"
	for x in \${DEP[@]}
	do
		processPkg \$x
	done
	instPkg \$1
}

processPkg \$1
EOF
	  install -Dm755 ${srcdir}/cran-get ${pkgdir}/usr/bin/cran-get
	  echo "Make sure the variable \$R_LIBS_USER is set in your environment. This will be the destination path where the packages will be installed. In this way no admin rights are required and each user can install its own packages."
  }
