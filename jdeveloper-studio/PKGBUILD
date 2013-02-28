# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=jdeveloper-studio
pkgver=11.1.1.7
pkgrel=1
pkgdesc="free integrated development environment"
url="http://www.oracle.com/technetwork/developer-tools/jdev/overview/index.html"
arch=('i686 x86_64')
license=('custom')
depends=("java-environment")
makedepends=()
conflicts=()
replaces=()
backup=()
install='jdeveloper-studio.install'
_jar_name=jdevstudio11117install.jar
source=(http://download/file/from/oracle/page/$_jar_name)
md5sums=('80b900443fb6a23b0cdbdf8914f83e82')
noextract=($_jar_name)
_dest_dir=$srcdir/$pkgname-$pkgver
_target_dir=opt/oracle/middleware
build() {
	cat >silent.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<bea-installer>
    <input-fields>
        <data-value name="BEAHOME" value="$_dest_dir"/>
        <data-value name="INSTALL_SHORTCUT_IN_ALL_USERS_FOLDER" value="false"/>
    </input-fields>
</bea-installer>
EOF
	java -jar $_jar_name -mode=silent -log=install.log
	rm ~/bea/beahomelist
	rmdir ~/bea
	local ESCAPED_DEST=$(_escape $_dest_dir)
	local ESCAPED_TARGET=$(_escape /$_target_dir)
	for _profile in /etc/profile.d/*.sh; do
    [[ $_profile != /etc/profile.d/locale.sh && -r $_profile ]] && . "$_profile"
  done
  unset _profile
	local ESCAPED_JAVA_HOME=$(_escape $JAVA_HOME)
	grep -rlZ "$ESCAPED_JAVA_HOME" $_dest_dir | xargs -0 sed -i "s/$ESCAPED_JAVA_HOME/\${JAVA_HOME_PLACEHOLDER}/g"
	grep -rlZ "$ESCAPED_DEST" $_dest_dir | xargs -0 sed -i "s/$ESCAPED_DEST/$ESCAPED_TARGET/g"
}

package() {
	cd $pkgdir
	mkdir -p $(dirname $_target_dir)
	cp -r $_dest_dir $_target_dir
	chmod -R +r $_target_dir 
	find $_target_dir -type d -exec chmod +x {} +
	find $_target_dir -perm /u+x -exec chmod +x {} +
}

_escape() {
	echo $1 | sed -e 's/\//\\\//g' -e 's/\./\\\./g'
}
