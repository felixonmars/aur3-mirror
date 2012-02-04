#!/bin/sh

# User overridable settings
PREFIX=/var/cache/archbuilder
CHROOT=$PREFIX/chroot.$$
CACHE=$PREFIX/cache
RESULT=$( pwd )
CHOWN=root
COLOR=1
PACMAN_PKG=""
PACMAN_BIN="pacman"

# Private settings
COREPKGS="glibc pacman coreutils filesystem sudo $PACMAN_PKG" # sudo is here to have it available on archbuilder shell
BASEPKGS="binutils cpio file findutils gawk gettext grep gzip less pcre perl popt ppp sed tar util-linux-ng vi wget which gcc patch pkgconfig make diffutils fakeroot"
CONFIGFILES="/etc/pacman.conf /etc/resolv.conf"
VERSION="0.6"
SILENT=">/dev/null"


error() {
	if [ $COLOR -ne 0 ]; then
		log "[31m$*[0m"
	else
		log "$*"
	fi
}

log() {
	if [ $COLOR -ne 0 ]; then
		echo "[34marchbuilder:[0m $*"
	else
		echo "archbuilder: $*"
	fi
}

li() {
	if [ $COLOR -ne 0 ]; then
		log "[33m - [0m$*"
	else
		log " - $*"
	fi
}

chroot() {
	if [ "$*" ]; then
		local CMD="$*"
	else
		local CMD="/bin/sh -i"
	fi
	#echo "CHROOTCMD: /usr/sbin/chroot $CHROOT /bin/sh -c \"HOME=/root; $CMD\""
	/usr/sbin/chroot $CHROOT /bin/sh -c "HOME=/root; unset LANG; $CMD"
}

rescue_packages() {
	local F=$CHROOT/var/cache/pacman/pkg
	local T=$CACHE/pkg
	test -e $F || return 0
	mkdir -p $T

	if [ -e $F -a "$( ls $F | wc -l )" -gt 0 ]; then
		for fn in $F/*; do
			local bn=$( basename $fn )
			if ! [ -e $T/$bn ]; then
				test "$HEADER" || log "Caching packages"
				local HEADER=1
				li "$bn"
				ln $F/$bn $T/$bn
			fi
		done
	fi
}

rescue_syncdb() {
	log "Caching sync db"
	mkdir -p $CACHE/sync
	rsync -a --del $CHROOT/var/lib/pacman/sync/ $CACHE/sync
}

prepare_chroot() {
	log "Creating chroot ($CHROOT)"
	mkdir -p $CACHE
	mkdir -p $CHROOT
	mkdir -p $CHROOT/dev
	mkdir -p $CHROOT/var/cache/pacman/pkg
	mkdir -p $CHROOT/var/lib/pacman/sync

	mknod $CHROOT/dev/console c 5 1
	mknod $CHROOT/dev/null c 1 3
	mknod $CHROOT/dev/zero c  1 5
	mknod $CHROOT/dev/random c 1 8
	mknod $CHROOT/dev/urandom c 1 9

	chmod 600 $CHROOT/dev/console
	chmod 666 $CHROOT/dev/{null,zero,random,urandom}
	chmod 666 $CHROOT/dev/{null,zero,random,urandom}
	
	mkdir $CHROOT/proc
	mount none $CHROOT/proc -t proc
}

restore_packages() {
	log "Restoring cached packages"
	local F=$CACHE/pkg
	local T=$CHROOT/var/cache/pacman/pkg
	mkdir -p $T
	#if [ -e $F -a "$( ls $F | wc -l )" -gt 0 ]; then
		#for fn in $F/*; do
			#local bn=$( basename $fn )
			#ln $F/$bn $T/$bn
		#done
	#fi
	test -d $F -a $(ls $F|wc -l) -gt 0 && cp -l $F/* $T
}

restore_syncdb() {
	if ! [ -e $CACHE/sync ]; then
		error "No sync db cache found; run archbuilder init first"
		cleanup_chroot
		exit 1
	fi
	log "Restoring sync db"
	if ! cp -al $CACHE/sync/* $CHROOT/var/lib/pacman/sync; then
		error "Error when restoring sync db"
		cleanup_chroot
		exit 1
	fi
}

copy_config() {
	log "Copying config files from host"
	for fn in $CONFIGFILES; do
		li "$fn"
		cp $fn $CHROOT/$fn
	done
}

create_user() {
	log "Creating archbuilder user"
	echo "archbuilder:x:1234:100:Arch Builder,,,:/tmp/build:/bin/sh" >> $CHROOT/etc/passwd
	echo "archbuilder::14117:0:99999:7:::" >> $CHROOT/etc/shadow
	echo "archbuilder ALL=NOPASSWD: ALL" >> $CHROOT/etc/sudoers
	mkdir -p $CHROOT/tmp/build
	chown 1234 $CHROOT/tmp/build
}

install_corepkgs() {
	log "Installing core packages"
	if ! sh -c "$PACMAN_BIN -S -r $CHROOT --cachedir $CHROOT/var/cache/pacman/pkg -b $CHROOT/var/lib/pacman --noconfirm $COREPKGS $SILENT"; then
		error "Error installing pacman, cleaning up"
		cleanup_chroot
		exit 1
	fi
}

create_chroot() {
	prepare_chroot
	restore_packages
	restore_syncdb
	install_corepkgs
	copy_config
	create_user
}

cleanup_chroot() {
	rescue_packages
	
	trap - SIGINT # Reset sigint so that if the user hammers ^C it wont loop

	test -d $CHROOT/proc && umount $CHROOT/proc
	
	log "Removing chroot"
	rm -rf $CHROOT
}

init() {
	prepare_chroot
	#install_corepkgs
	log "Installing core packages"
	# powerpill 15.9-1 fails with this, so no $PACMAN_BIN here
	if ! sh -c "pacman -Sy -r $CHROOT --cachedir $CHROOT/var/cache/pacman/pkg -b $CHROOT/var/lib/pacman --noconfirm $COREPKGS $SILENT"; then
		error "Error installing pacman, cleaning up"
		cleanup_chroot
		exit 1
	fi

	copy_config

	log "Downloading base packages"
	if ! chroot "$PACMAN_BIN -Sw --noconfirm $COREPKGS $BASEPKGS $SILENT"; then
		error "Error downloading base packages, cleaning up"
		cleanup_chroot
		exit 1
	fi

	rescue_syncdb
	cleanup_chroot
}

update() {
	create_chroot

	log "Downloading updates"
	if ! chroot "$PACMAN_BIN -Syuw --noconfirm $SILENT"; then
		error "Error syncing & downloading packages"
		cleanup_chroot
		exit 1
	fi

	rescue_syncdb
	cleanup_chroot
}

copy_pkgbuild() {
	local T=$1
	mkdir -p $T

	log "Copying PKGBUILD and related files"

	li "PKGBUILD"
	cp PKGBUILD $T/PKGBUILD

	local INSTALL=$( CARCH=$(arch); . ./PKGBUILD && echo $install )
	if [ "$INSTALL" -a -e $INSTALL ]; then
		li "$INSTALL"
		cp $INSTALL $T/$INSTALL
	fi

	local SOURCES=$( CARCH=$(arch); . ./PKGBUILD && echo ${source[*]} )
	if [ "$SOURCES" ]; then
		for SOURCE in $SOURCES; do
			if [ -e "$SOURCE" ]; then
				li "$SOURCE"
				cp $SOURCE $T/$SOURCE
			else
				if [ -e "$( basename $SOURCE )" ]; then
					local SOURCE=$( basename $SOURCE )
					li "$SOURCE"
					cp $SOURCE $T/$SOURCE
				elif [ "$SOURCE" = "$( basename $SOURCE )" ]; then
					# TODO: Add --ignoremissingsource
					error "Source \"$SOURCE\" not found"
					cleanup_chroot
					exit 1
				fi
			fi
		done
	fi

	local PKGNAME=$( . ./PKGBUILD && echo $pkgname )
	if echo $PKGNAME | grep -q -- '-git$'; then
		local GITNAME=$( . ./PKGBUILD && echo $_gitname )
		if [ "$GITNAME" -a -d "$GITNAME" -a -d "$GITNAME/.git" ]; then
			li "$GITNAME git repo"
			mkdir -p "$T/src"
			cp -r "$GITNAME" "$T/src"
		fi
	elif echo $PKGNAME | grep -q -- '-svn$'; then
		local SVNMOD=$( . ./PKGBUILD && echo $_svnmod )
		if [ "$SVNMOD" -a -d "$SVNMOD" -a -d "$SVNMOD/.svn" ]; then
			li "$SVNMOD svn repo"
			mkdir -p "$T/src"
			cp -r "$SVNMOD" "$T/src"
		fi
	fi

	unset CARCH
}

shell() {
	create_chroot

	test "$OPT_COPYPKGBUILD" && copy_pkgbuild "$CHROOT/tmp/build"
	log "Entering chroot"
	chroot "su - archbuilder"

	cleanup_chroot
}

build() {
	if ! [ -e PKGBUILD ]; then
		error "No PKGBUILD file found"
		exit 1
	fi

	create_chroot

	local T=$CHROOT/tmp/build

	copy_pkgbuild "$T"

	local VERDEPENDS=$( . ./PKGBUILD && echo ${depends[*]} ${makedepends[*]} )
	if [ "$VERDEPENDS" ]; then
		for DEP in $VERDEPENDS; do
			local DEPENDS="$DEPENDS $( echo $DEP | sed 's,[\<|\>|\=].*$,,' )"
		done
	fi

	log "Installing base packages & dependencies"
	if ! chroot "$PACMAN_BIN --noconfirm -S $BASEPKGS $DEPENDS $SILENT"; then
		error "Error installing dependencies"
		cleanup_chroot
		exit 1
	fi

	log "Building package"
	if ! chroot "su - archbuilder -c \"makepkg --noconfirm\""; then
		error "Error building package"
		if [ "$OPT_SHELLONERROR" ]; then
			log "Invoking shell as requested" 
			chroot "su - archbuilder"
		fi
		cleanup_chroot
		exit 1
	fi

	local ARCH="$( . $T/PKGBUILD && echo $arch )"
	test $ARCH = "any" || ARCH=$(arch)
	local PKGNAME=$( CARCH=$(arch); . $T/PKGBUILD && echo $pkgname )
	local PKGVER=$( CARCH=$(arch); . $T/PKGBUILD && echo $pkgver )
	local PKGREL=$( CARCH=$(arch); . $T/PKGBUILD && echo $pkgrel )
	local PKGFULL=$PKGNAME-$PKGVER-$PKGREL-$ARCH.pkg.tar.gz
	if [ -e $T/$PKGFULL ]; then
		mv $T/$PKGFULL $RESULT/$PKGFULL
		test "$CHOWN" && chown $CHOWN $RESULT/$PKGFULL
	else
		error "Unable to find resulting package, expected $PKGFULL"
		if [ "$OPT_SHELLONERROR" ]; then
			log "Invoking shell as requested" 
			chroot "su - archbuilder"
		fi
		cleanup_chroot
		exit 1
	fi

	if ! cmp -s $T/PKGBUILD PKGBUILD; then
		log "PKGBUILD changed, copying back"
		cp $T/PKGBUILD PKGBUILD
		test "$CHOWN" && chown "$CHOWN" PKGBUILD
	fi

	cleanup_chroot
}

sanity_check() {
	if [ "$(id -u)" -ne 0 ]; then
		error "archbuilder must be run as root"
		exit 1
	fi

	if [ $( basename ${CACHE}x ) = "x" ]; then
		error "CACHE must not end with /"
		exit 1
	fi

	if [ $( basename ${CHROOT}x ) = "x" ]; then
		error "CHROOT must not end with /"
		exit 1
	fi

	if [ $( basename ${RESULT}x ) = "x" ]; then
		error "RESULT must not end with /"
		exit 1
	fi

	# Test that CHROOT & CACHE is on the same filesystem and supports hard links
	test -e "$CHROOT" || mkdir -p "$CHROOT" 
	test -e "$CACHE" || mkdir -p "$CACHE" 

	touch $CACHE/test
	touch $CHROOT/test

	if [ "$( stat -c %d $CACHE/test )" -ne $( stat -c %d $CHROOT/test ) ]; then
		error "CACHE and CHROOT must be on the same filesystem"
		rm -f $CACHE/test $CHROOT/test $CHROOT/test2 $CACHE/test2
		exit 1
	fi

	if ! ln $CACHE/test $CHROOT/test2 2>/dev/null >/dev/null; then
		error "Needs a filesystem that supports hard-links"
		rm -f $CACHE/test $CHROOT/test $CHROOT/test2 $CACHE/test2
		exit 1
	fi
	rm -f $CACHE/test $CHROOT/test $CHROOT/test2 $CACHE/test2

	# Test if the filesystem supports devices
	if ! mknod $CHROOT/null c 1 3; then
		error "Chroot filesystem doesn't support devices"
		exit 1
	fi
	if ! echo "test" | tee $CHROOT/null >/dev/null 2>/dev/null; then
		error "Chroot filesystem doens't support devices"
		rm -f $CHROOT/null
		exit 1
	fi
	rm -f $CHROOT/null

	# Test if the filesystem supports suid binaries
	touch $CHROOT/suid
	if ! chmod +s $CHROOT/suid; then
		error "Chroot filesystem doens't support suid binarys"
		rm $CHROOT/suid
		exit 1
	fi
	rm $CHROOT/suid
}

usage() {
	echo "ArchBuilder $VERSION"
	echo ""
	echo "Usage: archbuilder command [options]"
	echo ""
	echo "Commands:"
	echo "init    - Populates sync cache"
	echo "update  - Updates sync cache"
	echo "shell   - Runs a shell in a temporary chroot"
	echo "build   - Builds a package"
	echo ""
	echo "Options:"
	echo "  --copypkgbuild  - Copies the PKGBUILD to the chroot, only for shell"
	echo "  --shellonerror  - Starts a shell when the package fails to build, only for build"
	echo "  --verbose       - Show pacman output"
}

CMD=$1
while test "$1"; do
	case "$1" in
		--copypkgbuild)	OPT_COPYPKGBUILD=1 ;;
		--shellonerror) OPT_SHELLONERROR=1 ;;
		--verbose) OPT_VERBOSE=1 ;;
		--help) usage; exit 0 ;;
		--*) error "Unknown option \"$1\"" ; exit 1 ;;
	esac
	shift 1
done

if ! [ "$CMD" ]; then
	usage
	exit 0
fi

test "$OPT_VERBOSE" && SILENT=""

trap cleanup_chroot SIGINT

# Load user settings
if test -e ~/.archbuilderrc; then
	log "Loading user settings (~/.archbuilderrc)"
	. ~/.archbuilderrc
else
	log "User settings not found (~/.archbuilderrc)"
fi

case "$CMD" in
	init)
		sanity_check
		init
		;;
	shell)
		sanity_check
		shell
		;;
	build)
		sanity_check
		build
		;;
	update)
		sanity_check
		update
		;;
	*)
		error "Unknown command: $CMD"
		exit 1
		;;
esac
