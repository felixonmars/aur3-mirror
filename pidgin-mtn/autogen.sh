#!/bin/sh

CONFIGURE_ARGS=""
if [ -f configure.args ] ; then
	. configure.args
fi

(glib-gettextize --version) < /dev/null > /dev/null 2>&1 || {
	echo;
	echo "You must have glib-gettextize installed to compile Pidgin.";
	echo;
	exit 1;
}

(intltoolize --version) < /dev/null > /dev/null 2>&1 || {
	echo;
	echo "You must have intltool installed to compile Pidgin.";
	echo;
	exit 1;
}

(libtoolize --version) < /dev/null > /dev/null 2>&1 || {
	echo;
	echo "You must have libtool installed to compile Pidgin.";
	echo;
	exit 1;
}

(automake --version) < /dev/null > /dev/null 2>&1 || {
	echo;
	echo "You must have automake installed to compile Pidgin.";
	echo;
	exit 1;
}

(autoconf --version) < /dev/null > /dev/null 2>&1 || {
	echo;
	echo "You must have autoconf installed to compile Pidgin.";
	echo;
	exit 1;
}

echo "Generating configuration files for Pidgin, please wait...."
echo;

echo "Running libtoolize, please ignore non-fatal messages...."
echo n | libtoolize --copy --force || exit 1;

# Add other directories to this list if people continue to experience
# brokennesses ...  Obviously the real answer is for them to fix it
# themselves, but for Luke's sake we have this.
for dir in "/usr/local/share/aclocal" \
           "/opt/gnome-1.4/share/aclocal"
do
	if test -d $dir ; then
		ACLOCAL_FLAGS="$ACLOCAL_FLAGS -I $dir"
	fi
done

libtoolize -c -f --automake
glib-gettextize --force --copy
intltoolize --force --copy
aclocal $ACLOCAL_FLAGS || exit 1;
autoheader || exit 1;
automake --add-missing --copy;
autoconf || exit 1;
automake || exit 1;

echo;
echo "Running ./configure ${CONFIGURE_ARGS} $@"
echo;
./configure ${CONFIGURE_ARGS} $@

