# Maintainer: ktalog <thektalog@gmail.com>
# Contributor: Florian Mounier aka paradoxxxzero <paradoxxx.zero@gmail.com>
pkgname=cinnamon-system-monitor-applet-git
pkgver=20120801
pkgrel=1
pkgdesc="System monitor extension for Cinnamon (display mem swap cpu usage)"
arch=('any')
url="http://github.com/paradoxxxzero/gnome-shell-system-monitor-applet/tree/gnome-3.2"
license=('GPL3')
depends=('cinnamon' 'python-gobject' 'libgtop')
makedepends=()
install=gschemas.install
source=('cinnamon-system-monitor-applet-config.desktop')
md5sums=('0f5d231b6d13552c8d9c6bf44395b671')

build() {
	wget -O system-monitor-applet.tar.gz https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet/tarball/gnome-3.2
	tar xvf system-monitor-applet.tar.gz
}

package() {
	cd ${srcdir}/paradoxxxzero-gnome-shell-system-monitor-applet*
    
	_extname=system-monitor@paradoxxx.zero.gmail.com
	cinnamonx_dir="$pkgdir/usr/share/cinnamon/extensions/$_extname"
	bin_dir="$pkgdir/usr/bin"
	gschema_dir="$pkgdir/usr/share/glib-2.0/schemas"
	application_dir="$pkgdir/usr/share/applications"
	language_dir="$pkgdir/usr/share/locale"

	mkdir -p $bin_dir
	mkdir -p $cinnamonx_dir
	mkdir -p $gschema_dir
	mkdir -p $application_dir

	sed -i 's|org.gnome.shell.extensions|org.cinnamon.extensions|' "$_extname/extension.js"
	sed -i 's|imports.gi.Shell;|imports.gi.Cinnamon;|' "$_extname/extension.js"
	sed -i 's|Shell|Cinnamon|' "$_extname/extension.js"
	sed -i 's|system-monitor-applet-config.desktop|cinnamon-system-monitor-applet-config.desktop|' "$_extname/extension.js"
	#revert to get the applet works, cf: "Can't Create a Javascript Object for libgtop_sysinfo;no way to copy"
	sed -i 's|GTop.glibtop_get_sysinfo().ncpu|this.get_cores()|' "$_extname/extension.js"
	sed -i 's|"3.2.0", "3.2","3.3.4"|"1.2", "1.3", "1.3.1", "1.4", "1.5.0", "1.5.2"|' "$_extname/metadata.json"
	sed -i 's|shell-version|cinnamon-version|' "$_extname/metadata.json"
	#if you don't want colored circle that represents the hard disk usage comment this line below
	sed -i 's|"#444", "#666", "#888", "#aaa", "#ccc", "#eee"|"#f88", "#8f8", "#88f", "#fbb", "#bfb", "#bbf"|' "$_extname/extension.js"
	#disable battery info because cinnamon don't include it
	sed -i 's|const Power = imports.ui.status.power;|//const Power = imports.ui.status.power;|' "$_extname/extension.js"
	sed -i 's|Battery = function()|/* Battery = function()|' "$_extname/extension.js"
	sed -i 's|Pie = function ()|*/ Pie = function ()|' "$_extname/extension.js"
	sed -i 's|battery: new Battery()|//battery: new Battery()|' "$_extname/extension.js"
	sed -i 's|//restore system power|/*restore system power|' "$_extname/extension.js"
	sed -i 's|Schema.run_dispose();|*/ Schema.run_dispose();|' "$_extname/extension.js"
	#disable network info because now it's not compatible
	sed -i 's|const NMClient = imports.gi.NMClient;|//const NMClient = imports.gi.NMClient;|' "$_extname/extension.js"
	sed -i 's|const NetworkManager = imports.gi.NetworkManager;|//const NetworkManager = imports.gi.NetworkManager;|' "$_extname/extension.js"
	sed -i 's|net: new Net()|//net: new Net()|' "$_extname/extension.js"
	sed -i 's|Net = function ()|/* Net = function ()|' "$_extname/extension.js"
	sed -i 's|Disk = function ()|*/ Disk = function ()|' "$_extname/extension.js"
	#disable battery and network settings
	sed -i "s|'net', 'disk', 'thermal', 'freq', 'battery')|'disk', 'thermal', 'freq') #disable:, 'net', 'battery'|" "system-monitor-applet-config.py"

	sed -i 's|gnome-shell-extensions|cinnamon-extensions|' "org.gnome.shell.extensions.system-monitor.gschema.xml"
	sed -i 's|org.gnome.shell.extensions|org.cinnamon.extensions|' "org.gnome.shell.extensions.system-monitor.gschema.xml"
	sed -i 's|/org/gnome/shell/extensions/|/org/cinnamon/extensions/|' "org.gnome.shell.extensions.system-monitor.gschema.xml"

	sed -i 's|org.gnome.shell.extensions|org.cinnamon.extensions|' "system-monitor-applet-config.py"
	
	for dir in po/* ;do
	 [[ -d "$dir" ]] && {
	 lang=$(basename "$dir")
	 mkdir -p "$language_dir/${lang}/LC_MESSAGES"
	 msgfmt "$dir/system-monitor-applet.po" -o "$language_dir/${lang}/LC_MESSAGES/cinnamon-system-monitor-applet.mo"
	}
	done
    
	install -m0755 system-monitor-applet-config.py $bin_dir/cinnamon-system-monitor-applet-config
    install -m0755 $srcdir/cinnamon-system-monitor-applet-config.desktop $application_dir
	install -m0644 org.gnome.shell.extensions.system-monitor.gschema.xml $gschema_dir/org.cinnamon.extensions.system-monitor.gschema.xml
	install -m0644 $_extname/*.{js,json,css} $cinnamonx_dir
}
