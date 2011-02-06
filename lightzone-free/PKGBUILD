# Contributer: N30N <archlinux@alunamation.com>
# Contributer: Ted Smith <tedsmith@tedsmithphotography.com>

pkgname="lightzone-free"
pkgver=2.4
pkgrel=3
pkgdesc="The last free version of LightZone, a professional photo browser and editor, like Aperture or Lightroom"
url="http://lightcrafts.com/linux/"
license=("custom")
arch=("i686" "x86_64")
if [ ${CARCH} == "x86_64" ]; then
	depends=("lib32-gcc-libs" "lib32-libstdc++5" "lib32-libx11" "lib32-libxcb" "lib32-libxtst")
else
	depends=("gcc-libs" "libstdc++5" "libx11" "libxtst" "java-runtime")
fi
makedepends=()
provides=('lightzone')
conflicts=('lightzone' 'lightzone3')
source=(
	'http://alunamation.com/archlinux/builds/lightzone/LightZone-rev.8224.tar.gz'
	'lightzone.desktop'
)
md5sums=(
	'ba3cf2bd4acf0a913e970091f395c2af'
	'74ce361dd355d8407d446a11aba4660a'
)

build() {
	mkdir -p $startdir/pkg/opt/lightzone/
	mkdir -p $startdir/pkg/usr/bin/
	ln -s /opt/lightzone/LightZone $startdir/pkg/usr/bin/lightzone
	install -D -m644 $startdir/src/lightzone.desktop \
	$startdir/pkg/usr/share/applications/lightzone.desktop

	cd $startdir/src/LightZone/

	if [ ${CARCH} == "x86_64" ]; then
		find . '(' '!' -name '*.pack' ')' '(' '!' -name 'firstrun' ')' \
			-exec cp --parents '{}' $startdir/pkg/opt/lightzone ';'
		cd jre/
		jar_files="rt.jar charsets.jar plugin.jar deploy.jar ext/localedata.jar jsse.jar"
		for jar_file in ${jar_files}; do
			bin/unpack200 -r "lib/${jar_file}.pack" \
			"$startdir/pkg/opt/lightzone/jre/lib/${jar_file}" || return 1
		done
		sed "s|^# INSTALL4J_JAVA_HOME_OVERRIDE=|INSTALL4J_JAVA_HOME_OVERRIDE='/opt/lightzone/jre'|" \
			-i $startdir/pkg/opt/lightzone/LightZone
		sed "s|^-client IF_SERVER_CLASS -server|-client KNOWN -server|" \
			-i $startdir/pkg/opt/lightzone/jre/lib/i386/jvm.cfg
	else
		mkdir -p $startdir/pkg/opt/lightzone/.install4j/
		cp * $startdir/pkg/opt/lightzone/
		cp .install4j/MessagesDefault $startdir/pkg/opt/lightzone/.install4j/
		cp .install4j/i4jruntime.jar $startdir/pkg/opt/lightzone/.install4j/
		cp .install4j/i4jparams.conf $startdir/pkg/opt/lightzone/.install4j/
		sed -i "s|^# INSTALL4J_JAVA_HOME_OVERRIDE=|INSTALL4J_JAVA_HOME_OVERRIDE='/opt/java/jre'|" \
		$startdir/pkg/opt/lightzone/LightZone
	fi
}
